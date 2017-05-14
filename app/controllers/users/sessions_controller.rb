class Users::SessionsController < Devise::SessionsController
 
  before_action :configure_permitted_parameters, if: :devise_controller?
# before_action :configure_permitted_parameters, only: [:create]
 # layout :layout_de_aplicacion
  protect_from_forgery with: :exception

  #efore_action :configure_sign_in_params, only: [:create]

  #Este es un callback que ofrece devices que me permite descubrir
  #el parametro role que se usó durante signin
  #DE desta forma puedo derivar a los diferentes tipos de usuarios s
  #según sus roles
  #1. auditor no importa role debe ir a evidencias_path
  #2. admin con role auditor debe ria a evidencias path
  #3. admin sin role auditor debe ir a gesiton_path
  def after_sign_in_path_for(params)

   if current_user.admin?
     if @role.nil? 
        gestion_path
     elsif @role == '0'
        gestion_path
     elsif @role == '1'
        evidencias_path
     end
    
   elsif current_user.auditor?
     evidencias_path
   elsif current_user.ingeniero?
     atenciones_path
   else
     root_path
   end
  end

  #Este es un callback de devise que me permite volver a la pantalla de bienvenida cuando se retire el usuario
  def after_sign_out_path_for(params)
    bienvenida_path
  end



  # GET /resource/sign_in
  # def new
  #   super
  # end

  #El usuario hace signin colo con su email, password y role
  # POST /resource/sign_in
  def create
    if params and params[:user]
       @role = params[:user][:role] 
       
       user_session["role"] = @role if user_session
    end
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:role])
  end

end
