#encoding: UTF-8

module Gestion::SessionsHelper



  def ingresar_a_presupuesto(presupuesto)
    if params[:remember_me] then
      cookies.permanent[:presupuesto_token] = presupuesto.remember_token
    else
      cookies[:presupuesto_token] = presupuesto.remember_token
    end
    current_presupuesto = presupuesto
  end

  def anotado_en_presupuesto?
    if !current_presupuesto.nil? then
      return true
    else
      return false
    end
  end

  def anotado_en_presupuesto
    unless anotado_en_presupuesto?
      store_location
      redirect_to presupuestos_path
      flash[:error] = "Por favor, inicie un presupuesto"
    end
  end


  def current_presupuesto=(presupuesto)
    @current_presupuesto == presupuesto
  end


  def current_presupuesto
    @current_presupuesto ||= presupuesto_from_remember_token
  end


  def current_presupuesto?(presupuesto)
     presupuesto == current_presupuesto
  end


  def ultimo_trabajo
    p=Presupuesto.con_foto.last
    return p
  end


 def ingresar_a_auditoria(auditoria)
    if params[:remember_me] then
      cookies.permanent[:auditoria_token] = auditoria.remember_token
    else
      cookies[:auditoria_token] = auditoria.remember_token
    end
    current_auditoria = auditoria
  end


  def anotado_en_auditoria?
    if !current_auditoria.nil? then
      return true
    else
      return false
    end
  end

  def anotado_en_auditoria
    unless anotado_en_auditoria?
      store_location
      redirect_to auditorias_path
      flash[:error] = "Por favor, inicie una auditoria"
    end
  end


  def current_auditoria=(auditoria)
    @current_auditoria == auditoria
  end

  def current_auditoria
    @current_auditoria ||= auditoria_from_remember_token
  end

  def auditoria_from_remember_token
    auditoria_token = cookies[:auditoria_token]
    Gestion::Auditoria.find_by_remember_token(auditoria_token) unless auditoria_token.nil?
  end

  def current_auditoria?(audioria)
     presupuesto == current_auditoria
  end

  private

   #Como admin sin rol de auditor solo puedo ver los registros generales. enviar emails a clientes, crear autidoiras
  #Como admin con rol de auditor puedo subir fotos
  #Como auditor solo puedo subir fotos


   #Como admin sin rol de auditor solo puedo ver los registros generales. enviar emails a clientes, crear autidoiras
  #Como admin con rol de auditor puedo subir fotos
  #Como auditor solo puedo subir fotos
    def admin_user!
      unless signed_in? and current_user.admin?
	  flash[:notice]="Por favor inicie sesión como administrador".encode('UTF-8')
	  redirect_back(fallback_location: root_path) 
      end
    end

    def auditor_user
      if signed_in?
	if (current_user.admin? and user_session["role"] == "1") or current_user.auditor?
	  #stay
	else
          #puts user_session.inspect
	  #lash[:notice]= "Por favor inicie sesión como auditor".encode('UTF-8')
 	  redirect_back(fallback_location: root_path) 	
          flash[:notice]= "Por favor inicie sesión como auditor".encode('UTF-8')
	            
	end
      else
        flash[:notice]= "Por favor inicie sesión".encode('UTF-8')
        redirect_back(fallback_location: root_path)   
      end
    end
    
    def visitante_user
      if signed_in?      
       #flash[:notice] = "Ud ya ha iniciado sesión".encode('UTF-8')
       if current_user.admin?
         redirect_back(fallback_location: gestion_path) 
       elsif current_user.auditor?
	 redirect_back(fallback_location: evidencias_path)
       end
      end
    end

    def ingeniero_user
      unless signed_in? and current_user.ingeniero?
         flash[:notice]= "Por favor inicie sesión como ingeniero".encode('UTF-8')
         redirect_back(fallback_location: root_path)
      end
    end



    def prohibido
      flash[:notice]= "No está permitida la edición de auditorias".encode('UTF-8')
      redirect_back(fallback_location: root_path)
    end





    def hay_ingeniero
      unless User.ingeniero.any?
        flash[:notice] = "No hay definido responsable de eventos".encode('UTF-8')
        redirect_back(fallback_location: root_path)
      end
    end

end
