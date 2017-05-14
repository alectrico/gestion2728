class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
   def create
     super
#     perfil = Gestion::Usuario.create(:email => current_user.email + ".2728.cl", :nombre => current_user.name.truncate(3),:activo => true) 
#     perfil.user = current_user
#     perfil.save!
#     current_user.reload
     if User.count == 1
       current_user.admin = true
       current_user.save
     end
     Gestion::UsuarioMailer.welcome_visitante(current_user).deliver_later
     Gestion::UsuarioMailer.noti_visitante(current_user).deliver_later
  # SendEmailJob.set(wait: 20.seconds).perform_later(current_user,'visitante',Rails.env) No es necesario dado que ahora ActiveJobs está integrado con ActionMailer
   end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: ['name','fono'])
   end

  # If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: ['name','fono'])
   end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
