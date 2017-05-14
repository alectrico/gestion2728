#encoding: UTF-8
class ProyectosController < ElectricoController
#before_action :authenticate #, only: [:bajar_te1]

before_action :pdfpagado , only: [:bajar_te1,:bajar_croquis]
#Vesion azucarad de presupuestos, 
#Vesion azucarad de presupuestos, 

#Los proyectos son presupuestos que han sido seleccionados y embellecidos
#para que puedan ser vistos por visitantes
#Los visitantes podrán tener una muestra representativa de nuestro
#trabajo y convertirse en clientes nuestros (o mandantes)

#Los proyectos solo podrán ser aquelos presupuestos que tengan fotos y hayan sido pagados


#Los proyectos no se crean sino que solamente se muestran, tampoco se pueden borrar o eliminar

def show
  logger.info "Estoy en show de proyectos"
  @proyecto = Presupuesto.con_foto.find(params[:id])
  ingresar_a_presupuesto(@proyecto)
  current_presupuesto = @proyecto

  session[:proyecto_id] = @proyecto.id
  session[:te1_foto_id] = @proyecto.te1_foto_id
  respond_to do |format|
    format.html
    format.json { render json: @proyecto }
  end
end




def pdfpagado

  @proyecto = Proyecto.find_by_id(params[:id])
  proyecto_id=@proyecto.id

  unless current_user.nil?

    pagos= Pago.where(user_id: current_user.id, custom: proyecto_id, item_number: "CROQUIS",sandbox:nil)



    logger.info pagos.inspect
    if pagos.count > 0
      logger.info "Los id de pagos son: --------------"
      pagos.each{|p| logger.info p.id}
      logger.info "-.-------------------------------"
      @pago=pagos.last

      usuario =@pago.user
      logger.info "usuario es"
      logger.info usuario.name
      if @pago.remote_ip == request.remote_ip
        logger.info "El ip del pago coincide con el actual"
      end
      if @pago.sandbox
        flash[:notice] = "Al menos hay un pago de prueba que no califica"
      else

        logger.info "Existen pagos para el usuario actual"
        logger.info "payment_date es :"
        logger.info @pago.payment_date
        flash[:notice]= "Fue encontrado al menos un pago para el usuario actual para este pdf"
      end

      else
      flash[:error]="No existen pagos para el usuario actual"
      redirect_to proyecto_url(@proyecto)

    end

  else
    if Pago.exists?(custom: proyecto_id)
      @pago = Pago.order(:payment_date).last
      logger.info "pago es"
      logger.info @pago.id
      if @pago.remote_ip == request.remote_ip
        logger.info "Time now es"
        logger.info Time.now
        logger.info "payment_date es :"
        logger.info @pago.payment_date
        logger.info "time.now - 1.day"
        logger.info Time.now - 1.day
        logger.info "Payment date > Time.now - 2.minutes"

       on_time = @pago.payment_date > (Time.now - 35.minute)

        flash[:notice] = "Verificando pago"
        if on_time
          flash[:notice] = "El pago es de hace menos de 35 minutos"

          logger.info "El pago es de hace menos de 35 minutos"
        else
          flash[:notice] = "El pago es de hace más de 35 minutos"

          logger.info "El pago es de hace más de 35 minutos"
        end
        if on_time
          #flash[:notice] = "Ahora puede bajar el CROQUIS"

          #render bajar_croquis_proyecto_url
        else
          #logger.info "El pago fue hace mucho tiempo"

           redirect_to proyecto_url(@proyecto)
        end
      else
        logger.info "El ultimo pago registrado no corresponde a la ip de este request"

      end
    else
       logger.info "No se econtró ninguna pago registrado para este te1"

   end

   logger.info "Me devuelvo a proyecto"
   #redirect_to proyecto_url(@proyecto)
 end
end







def te1pagado
    


  @proyecto = Proyecto.find_by_id(params[:id])
  proyecto_id=@proyecto.id

  unless current_user.nil?

    pagos= Pago.where(user_id: current_user.id, custom: proyecto_id, item_number: "TE1",sandbox:nil)


       
    logger.info pagos.inspect
    if pagos.count > 0 
      logger.info "Los id de pagos son: --------------"
      pagos.each{|p| logger.info p.id}
      logger.info "-.-------------------------------"
      @pago=pagos.last

      usuario =@pago.user
      logger.info "usuario es"
      logger.info usuario.name
      if @pago.remote_ip == request.remote_ip
        logger.info "El ip del pago coincide con el actual"
      end
      if @pago.sandbox
	flash[:notice] = "Al menos hay un pago de prueba que no califica"
      else

	logger.info "Existen pagos para el usuario actual"
	logger.info "payment_date es :"
	logger.info @pago.payment_date
	flash[:notice]= "Fue encontrado al menos un pago para el usuario actual para este pdf"
      end

      else
      flash[:error]="No existen pagos para el usuario actual"
      redirect_to proyecto_url(@proyecto)

    end  

  else
    if Pago.exists?(custom: proyecto_id)
      @pago = Pago.order(:payment_date).last
      logger.info "pago es"
      logger.info @pago.id
      if @pago.remote_ip == request.remote_ip
	logger.info "Time now es"
	logger.info Time.now
	logger.info "payment_date es :"
	logger.info @pago.payment_date
	logger.info "time.now - 1.day"
	logger.info Time.now - 1.day
	logger.info "Payment date > Time.now - 2.minutes"
	
	on_time = @pago.payment_date > (Time.now - 35.minute)
	
	flash[:notice] = "Verificando pago"
	if on_time
	  flash[:notice] = "El pago es de hace menos de 35 minutos"

	  logger.info "El pago es de hace menos de 35 minutos"
	else
	  flash[:notice] = "El pago es de hace más de 35 minutos"

	  logger.info "El pago es de hace más de 35 minutos"
	end
	if on_time
	  #flash[:notice] = "Ahora puede bajar el TE1"
	  
	  #render bajar_te1_proyecto_url
	else
	  #logger.info "El pago fue hace mucho tiempo"

	   redirect_to proyecto_url(@proyecto)
	end
      else
	logger.info "El ultimo pago registrado no corresponde a la ip de este request"

      end
    else
       logger.info "No se econtró ninguna pago registrado para este te1"

   end

   logger.info "Me devuelvo a proyecto"
   #redirect_to proyecto_url(@proyecto)
 end
end


def bajar_te1
  @proyecto = Proyecto.find_by_id(params[:id])
end


def comprar_croquis
    @proyecto = Proyecto.find_by_id(params[:id])
    render '/pagos/croquis',layout:false
end


def bajar_croquis
  @proyecto = Proyecto.find_by_id(params[:id])
end




def index
  @proyectos = Presupuesto.con_foto.all

  respond_to do |format|
   format.html
   format.json { render json: @proyectos }
  end
end

private

def authenticate
  logger.info "Estoy en authenticate"
  @pago = Pago.last
  paye_id    = @pago.first_name
  paye_email = @pago.payer_email
  
  usuario={ paye_id=>paye_email}

  authenticate_or_request_with_http_digest do |emailuthenticate_or_request_with_http_digest|
    usuario[username]
  end
end

end
