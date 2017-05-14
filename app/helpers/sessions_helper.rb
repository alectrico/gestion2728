#encoding: UTF-8
module SessionsHelper

  def ingresar_a_presupuesto(presupuesto)

    if params[:remember_me] then
      cookies.permanent[:presupuesto_token] = presupuesto.remember_token
    else
      cookies[:presupuesto_token] = presupuesto.remember_token
    end

    current_presupuesto = presupuesto
  end

  def sign_in(user)
   #se supone que es llamado desde una pgina de login donde hay un
   #control que se llama remember_me
   
      if params[:remember_me] then
	cookies.permanent[:remember_token] = user.remember_token
      else
        cookies[:remember_token] = user.remember_token
      end

      current_user= user


      logger.info "current_user es nil" if self.current_user.nil?
      logger.info "El usuario corriente es #{current_user.name}"
      logger.info "El estado es:"
      logger.info current_user.estado
      logger.info "Según sign_in"
      @current_presupuesto = nil
      rol="alumno" if current_user.alumno?
      rol="cliente" if current_user.client?
      rol="profesor" if current_user.profesor?
      rol="instalador" if current_user.instalador?
      rol="member" if current_user.member?
      rol="visitante" if current_user.visitante?
      unless rol.blank?
        flash[:notice] = "#{current_user.name}, UD. ha iniciado sesión con el rol de #{rol}"
      else
        flash[:notice] = "#{current_user.name}, UD. ha iniciado sesión en #{Rails.configuration.x.domain['name']}"
      end
  end

 
  def signed_in?
   
    if !current_user.nil? then
      return true
    else
      return false
    end
  end

  def anotado_en_presupuesto?

    if !current_presupuesto.nil? then
      return true
    else
      return false
    end
  end

  def not_signed_in_user
    if signed_in?
       redirect_to home_path       
    end
  end


  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path
      flash[:error] = "Por favor, inicie sesion"
    end
  end

  def anotado_en_presupuesto
    unless anotado_en_presupuesto?
      store_location
      redirect_to presupuestos_path
      flash[:error] = "Por favor, inicie un presupuesto"
    end
  end


  def get_current_user_name
    @msg = 'presione "Seguir como" '
    if current_user
      @msg = @current_user.name
      if current_presupuesto
        @msg = "Ud ha comenzado a armar sus circuitos en #{Domain.get_name_http} con presupuesto #{current_presupuesto.id}. Sus circuitos permanecerán guardados mientras dure la obra."
      else
        @p=Presupuesto.find_by_user_id(@current_user.id)
	if @p
	  ingresar_a_presupuesto(@p)
          @msg = "Ha iniciado una sesión en Alectrico como #{@current_user.name}. Su presupuesto es:  #{@p.id}. Ud tiene #{@p.circuitos.count} circuito(s) ya ingresado(s). "
	else
	  @msg = "Ha iniciado una sesión en Alectrico como #{@current_user.name}   "
	end
      end
    else
      @msg = 'presione "Seguir como"'
    end
  end



  def get_feed_facebook
    @msg = 'presione "Seguir como"'
    if current_user
      @msg = @current_user.name
      if current_presupuesto
        @msg = "ya ha iniciado una sesión en Alectrico como #{@current_user.name}  #{current_presupuesto.id} "
      else
        @p=Presupuesto.find_by_user_id(@current_user.id)
        if @p
          ingresar_a_presupuesto(@p)
          @msg = "ya ha iniciado una sesión en Alectrico como #{@current_user.name}. Su presupuesto es:  #{@p.id}. Ud tiene #{@p.circuitos.count} circuito(s) ya ingresado(s). "
        else
          @msg = "ya ha iniciado una sesión en Alectrico como #{@current_user.name}   "
        end
      end
    else
      @msg = 'presione "Seguir como"'
    end
  end





  def current_user=(user)
    logger.info "Guardado @current_user"
    #logger.info "@current_user= #{@current_user.name}"
    @current_user == user
  end

  def current_presupuesto=(presupuesto)
    @current_presupuesto == presupuesto
  end

  def current_user
    @current_user ||= user_from_remember_token
  end


  def current_presupuesto
    @current_presupuesto ||= presupuesto_from_remember_token
  end


  def current_presupuesto?(presupuesto)
     presupuesto == current_presupuesto
  end

  def current_user?(user)
    user == current_user
  end



  def sign_out
    @last_user = current_user
    current_user = nil
    current_presupuesto = nil
    cookies.delete(:remember_token)
    cookies.delete(:presupuesto_token)
    
  end



  def redirect_back_or(default)
   redirect_to session[:return_to] || default,:protocol => 'https'
   clear_return_to
  end



  def store_location
    session[:return_to] = request.fullpath
  end

  def ultimo_trabajo
    p=Presupuesto.con_foto.last
    return p
  end


  private

    

    def presupuesto_from_remember_token
      presupuesto_token = cookies[:presupuesto_token]
      Presupuesto.find_by_remember_token(presupuesto_token) unless presupuesto_token.nil?
    end

  
    def user_from_remember_token
      remember_token = cookies[:remember_token]
      User.find_by_remember_token(remember_token) unless remember_token.nil?
    end

    def clear_return_to
      session.delete(:return_to)
    end

    def signed_in_user
     redirect_to new_user_session_path, notice: "Por favor inicie sesión".encode('UTF-8') unless signed_in?
    end
=begin
    def admin_user
      redirect_to signin_path, notice: "Por favor inicie sesión como administrador".encode('UTF-8'), :protocol => 'https' unless current_user != nil and signed_in? and current_user.admin? 

    end
=end
    def admin_user
      redirect_to signin_path, notice: "Por favor inicie sesión como administrador".encode('UTF-8') unless current_user != nil and signed_in? and current_user.admin?
    end





    def profesor_user
      logger.info "Estoy en profesor_user"
      logger.info "current_user es nil" if current_user.nil?
       unless current_user.nil?
         logger.info "current_user es"
         logger.info current_user.name
         logger.info "Current_user es profesor" if current_user.profesor?
       end
       redirect_to new_user_session_path, notice: "Por favor inicie sesión como profesor".encode('UTF-8') unless current_user != nil and signed_in? and current_user.profesor?
    end


     def client_user
         redirect_to '/buy_now', notice: "Contenido reservado".encode('UTF-8') unless current_user !=nil and signed_in? and current_user.client?
     end


     def member_user
       redirect_to '/suscribase' , notice: "Debe suscribirse para poder accesar el contenido reservado para miembros" unless current_user !=nil and signed_in? and (current_user.member? or current_user.admin?)
       #redirect_to signin_path, notice: "Debe suscribirse para poder accesar el contenido reservado para miembros" unless current_user !=nil and signed_in? and current_user.member?
     end



  
end
