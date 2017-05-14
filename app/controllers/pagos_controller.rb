#encoding: ISO-8859-1
require 'net/http'
require 'uri'
class PagosController < ElectricoController
#layout "mobi"
#before_filter :force_ssl
before_filter :admin_user, only: [:index, :edit,:update,:destroy]

#ontrola la recpeción de los pagos desde paypal y asigna a estos usuarios
#l gurop member.

  # GET /pagos
  # GET /pagos.json
  def cancel
   #este procedimeinto es llamado desde paypal cuando el usuasrio cancela el pago. Debiera construir algo sobre esto
   render 'cancel'
  end



  def agotada
   render 'agotada'
  end



  def croquis
      #msg = request.query_string


      #logger.info session.loaded?
      #logger.info session

      #session[:init] = true
      #logger.info session.loaded?
      #logger.info session
    #
      logger.info "Voy a verificar el boton"

      boton=verificar_boton


      unless boton.nil?
        logger.info "Botón verificado"

        logger.info "Voy a crear un prepago"
        prepago = Pago.new

        prepago.tx = params[:tx]
        prepago.st = params[:st]
        prepago.amt= params[:amt]
        prepago.cc = params[:cc]
        prepago.cm = params[:cm]
        prepago.create_botone_id = boton.id
        prepago.host = request.host
        prepago.remote_ip = request.remote_ip
        prepago.item_number = params[:item_number]

        logger.info "llamando a procesar_pago"

        pago = procesar_pago(params[:tx],boton)
        unless pago.nil?
          prepago.destroy
          if pago.sandbox
            logger.info "Pago es sandbox"
          else

            tx = params[:tx]
            amt= params[:mat]
            item_number = [:item_number]
            divisa = [:cc]
            cm = params[:cm]
            estado_transaccion = params[:st]


            session[:current_pago]= nil
            session[:nombre] = nil
            session[:email] = nil

            logger.info "....current_pago "
            logger.info session[:current_pago]


            logger.info "--------"

            session
           #respond_to do |format|
             # format.html
            #end
            #redirect_to current_presupuesto

            #proyecto=Proyecto.find_by_id(session[:proyecto_id])
            #edirect_to proyecto_url(p)
            foto_id=Presupuesto.find_by_id(pago.custom).croquis_foto_id
            #redirect_to code_image_foto_url(foto_id)
            redirect_to bajar_croquis_proyecto_url(pago.custom)
            #respond_to do |format|
            #  format.html
            #end

         end
      end
    end
  end







  def te1
      msg = request.query_string


      logger.info session.loaded?               
      logger.info session                       

      session[:init] = true           
      logger.info session.loaded?               
      logger.info session      

      logger.info session[:proyecto_id]
      logger.info session[:te1_foto_id]
      boton=verificar_boton


      unless boton.nil?



	logger.info "Botón verificado"


	prepago = Pago.new

	prepago.tx = params[:tx]
	prepago.st = params[:st]
	prepago.amt= params[:amt]
	prepago.cc = params[:cc]
	prepago.cm = params[:cm]
	prepago.create_botone_id = boton.id
	prepago.host = request.host
	prepago.remote_ip = request.remote_ip
	prepago.item_number = params[:item_number]

	logger.info "llamando a procesar_pago"

	pago = procesar_pago(params[:tx],boton)
	unless pago.nil?
	  prepago.destroy
	  if pago.sandbox
	    logger.info "Pago es sandbox"
	  else
     
	    tx = params[:tx]
	    amt= params[:mat]
	    item_number = [:item_number]
	    divisa = [:cc]
	    cm = params[:cm]
	    estado_transaccion = params[:st]

	    logger.info "----------------"

	    #logger.info session.inspect
	    logger.info session[:te1_foto_id]
	    logger.info session[:proyecto_id]

	    logger.info ".............."

            session[:current_pago]= nil
            session[:nombre] = nil
	    session[:email] = nil

            logger.info "....current_pago "
            logger.info session[:current_pago]
	    

	    logger.info "--------"

            session
            #respond_to do |format|
             # format.html
            #end
	    #redirect_to current_presupuesto

	    #proyecto=Proyecto.find_by_id(session[:proyecto_id])
	    #edirect_to proyecto_url(p)
	    foto_id=Presupuesto.find_by_id(pago.custom).te1_foto_id
	    #redirect_to code_image_foto_url(foto_id)
	    redirect_to bajar_te1_proyecto_url(pago.custom)
	    #respond_to do |format|
	    #  format.html
	    #end
	
	 end
      end
    end
  end



  def bajar_plano_original


      logger.info "Llegué al punto de entrada en /bajar_te1"
      logger.info "Debo llegar a aquí cuando alguien pague por bajar el plano original"
      
      tx = params[:tx]
      amt= params[:mat]
      item_number = [:item_number]
      divisa = [:cc]
      cm = params[:cm]
      estado_transaccion = params[:st]

      respond_to do |format|

       format.html

      end

  end


  def bajar_plano_electrico_desreferenciado


      logger.info "Llegué al punto de entrada en /bajar_te1"
      logger.info "Debo llegar a aquí cuando alguien pague por bajar el plano electrico_desreferenciado"

      tx = params[:tx]
      amt= params[:mat]
      item_number = [:item_number]
      divisa = [:cc]
      cm = params[:cm]
      estado_transaccion = params[:st]

      respond_to do |format|

       format.html

      end

  end




  def bajar_unilineal


      logger.info "Llegué al punto de entrada en /bajar_te1"
      logger.info "Debo llegar a aquí cuando alguien pague por bajar el digrama unilineal"

      tx = params[:tx]
      amt= params[:mat]
      item_number = [:item_number]
      divisa = [:cc]
      cm = params[:cm]
      estado_transaccion = params[:st]

      respond_to do |format|

       format.html

      end

  end

  def bajar_unilineal_desreferenciado


      logger.info "Llegué al punto de entrada en /bajar_te1"
      logger.info "Debo llegar a aquí cuando alguien pague por bajar el digrama unilineal desreferenciado: sin direcció ni nombre"

      tx = params[:tx]
      amt= params[:mat]
      item_number = [:item_number]
      divisa = [:cc]
      cm = params[:cm]
      estado_transaccion = params[:st]

      respond_to do |format|

       format.html

      end

  end



  def suscribe
      logger.info "Llegué al punto de entrada en /suscribe"
      logger.info "LLego aquí cuando el host debiera ser mobi y los botones de suscripcion"

      msg = request.query_string
      if msg=="" then
        #ocrrer cuando quieor mostrar el mobton de suscribe
        render 'suscribe'
        return
      end

      logger.info params


      prepago = Pago.new
      prepago.tx = params[:tx]
      prepago.st = params[:st]
      prepago.amt= params[:amt]
      prepago.cc = params[:cc]
      prepago.cm = params[:cm]
      prepago.host = request.host
      prepago.remote_ip = request.remote_ip
      prepago.item_number = params[:item_number]


      logger.info "llamando a procesar_pago"

      pago = procesar_pago(params[:tx])

      unless pago.nil?
	prepago.destroy
        if pago.sandbox
          logger.info "Pago es sandbox"
        else
          logger.info "Pago es real"
        end
      else
	prepago.save #preserva algo de informacion porque PDT a veces no se puede confirmar si mi servidor no está activo"
      end

      unless pago.nil?
       logger.info "Pago procesado"
       session[:current_pago]=pago.id
       session[:nombre] = pago.paye.name
       session[:email] = pago.paye.email  
      end



  end


  def buy_now

      msg = request.query_string
      if msg=="" then
        #ocrrer cuando quieor mostrar el mobton de suscribe
        render 'buy_now'
        return
      end
      pagando
  end


  


 def buy_citofonia

      msg = request.query_string
      if msg=="" then
        #ocrrer cuando quieor mostrar el mobton de suscribe
        render 'buy_citofonia'
        return
      end
      pagando
  end




 def buy_electricidad

      msg = request.query_string
      if msg=="" then
        #ocrrer cuando quieor mostrar el mobton de suscribe
        render 'buy_electricidad'
        return
      end
      pagando
  end




def index
    @pagos = Pago.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pagos }
    end
  end

  # GET /pagos/1
  # GET /pagos/1.json
  def show
    @pago = Pago.find(params[:id])
    session[:current_pago]=@pago.id

    #redirect_to '/users/new'
    respond_to do |format|
     format.html # show.html.erb
     format.json { render json: @pago }
    end
  end

  # GET /pagos/new
  # GET /pagos/new.json
  def new
  end

  # GET /pagos/1/edit
  def edit
    @pago = Pago.find(params[:id])
  end



  # POST /pagos
  # POST /pagos.json
  def create
    @pago = Pago.new(params[:pago])

    respond_to do |format|
      if @pago.save
        format.html { redirect_to @pago, notice: 'Su Pago fue archivado correctamente en nuestra base de datos.'}
        format.mobile { redirect_to @pago, notice: "Su Pago fue archivado correctamente en nuestra base de datos."}
        format.json { render json: @pago, status: :created, location: @pago }
      else
        format.html { render action: "new" }
        format.mobile { render action: "new"}
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end


  # PUT /pagos/1
  # PUT /pagos/1.json
  def update
    @pago = Pago.find(params[:id])

    respond_to do |format|
      if @pago.update_attributes(params[:pago])
        format.html { redirect_to @pago, notice: 'Pago was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    @pago = Pago.find(params[:id])
    @pago.destroy

    respond_to do |format|
      format.html { redirect_to pagos_url }
      format.json { head :no_content }
    end
  end


private

=begin
  arma el contenido de un pedido html para paypal
  debe ser especifico para el tipo de cuenta
  el tipo de cuenta está amarrado a Rails.env
 
  1. Comprador compra presiona nuesro boton de copra
        2. Comprador paga en paypal a un business
        3. Paypal redirige al comprador a una dirección en alectrico o mobi
        4. La direccion en alectrico o mobi llama a procedimientos para autorizaar el acceso
        5. Dentro de los procedimientos esta enviar una request para pedir mas datos, aunque pensándolo bien, en algunas compras se podría autorizar inmediatamene
=end
    def verificar_boton
      if params[:st]=="Completed"
        boton=CreateBotone.find_by_item_number(params[:item_number])
        logger.info boton.inspect
        unless boton.nil?
          if boton.controller == "proyectos" and boton.action == "show"
	      logger.info "Controlador y acciones bien"
	      logger.info params[:cc]
	      logger.info boton.mc_currency
              if boton.mc_currency == params[:cc]
		logger.info "Divisa bien"
                pago_liquido = Float(params[:amt])
                pago_calculado = boton.mc_gross * 1.1
		logger.info "Cálculos realizados"
                if pago_liquido - pago_calculado.round(2)
		  logger.info "El monto pagado está correcto"
                  return boton
                else
                  return nil
                  logger.info "El monto pagado no está correcto"
                  logger.info "Pagado es #{pago_liquido}"
                  logger.info "Adeudado es #{pago_calculado.round(2)}, incluye 10% de  impuesto de honorarios"
                end
              end
            end
          end
        end
      end


  def procesar_pago(tx,boton)
      pago = nil
      pdt = pdt(Rails.env)
      respuesta = query(tx,pdt,Rails.env)

	if !respuesta.nil? and /\ASUCCESS/.match(respuesta) then
	  logger.info "Verificando la empresa"
	  mi_empresa=empresa(Rails.env)
	  /receiver_email=(?<receiver_email>.*)/ =~ respuesta
	  if mi_empresa == receiver_email
	    logger.info "La empresa es #{mi_empresa}"
	    pago = Pago.find_by_tx(params[:tx])
	    if pago.nil?
	      pago = guardar_pago(respuesta,boton)
	      paye = guardar_paye(respuesta)
	      pago.paye_id = paye.id
	       if pago.save and paye.save
		 if signed_in?
		   pago.user_id = current_user unless current_user.nil?
		   logger.info "El pagador o payer es el usuario corriente se deja el link desde elpago"
		  else
		   logger.info "Es un visitante, no se pedira login pues solo quiere comprar"
		 end
		 logger.info "Se unio el paye al pago"
	       else
		 logger.info "No se pudo unir pay al pago"
	       end
	    else
	     logger.info "Ya el pago está registrado"
	    end
	  else
	    render text: "Paypal ha reportado un pago a una cuenta diferente de la que corresponde a este pago, por favor revise los datos de la transacción en Paypal".encode('utf-8')
	  end
	elsif /\AFAIL/.match(respuesta) then
	 render text: 'Esta transacción ha fallado según informa Paypal, intentelo de nuevo o comuníquese con alexander.espinosa.hernandez@gmail.com.'.encode('utf-8') + res_val
	  #aqui falta tomar cuenta el error
	end
      return pago
  end

 def guardar_paye(respuesta)

       /payer_email=(?<payer_email>.*)/ =~ respuesta
       /payer_id=(?<payer_id>.*)/ =~ respuesta
       /first_name=(?<first_name>.*)/ =~ respuesta
       /last_name=(?<last_name>.*)/ =~ respuesta
       /address_city=(?<address_city>.*)/ =~ respuesta
       /address_country=(?<address_country>.*)/ =~ respuesta
       /address_state=(?<address_state>.*)/ =~ respuesta
       /address_country_code=(?<address_country_code>.*)/ =~ respuesta
       /address_name=(?<address_name>.*)/ =~ respuesta
       /address_street=(?<address_street>.*)/ =~ respuesta
       /address_zip=(?<address_zip>.*)/ =~ respuesta
       /test_ipn=(?<test_ipn>.*)/ =~ respuesta

        paye= User.find_by_email(payer_email)


        if paye.nil?
          paye = User.new(:email => payer_email, :name => first_name + " " +last_name, :direccion => address_city + " " + address_country + " " + address_state + " " + address_country_code + " " +  address_name + " " + address_street + " " +address_zip, :password => "123456",:password_confirmation => "123456")
           paye.paye = true

           if paye.save
              logger.info "Se ha creado un nuevo paye #{paye.email}"
           else
               logger.info paye.errors.inspect
           end
        else
          logger.info "El paye existe y es #{paye.email}"
        end
   return paye
  end





  def guardar_pago(res_val,boton)

        #ender text: 'exito' + res_val
    
        /custom=(?<custom>.*)/ =~ res_val

        /last_name=(?<last_name>.*)/ =~ res_val
        /transaction_subject=(?<transaction_subject>.*)/ =~ res_val
        /payment_date=(?<payment_date>.*)/ =~ res_val
        /payment_date=(?<payment_date_string>.*)/=~ res_val
        /txn_type=(?<txn_type>.*)/ =~ res_val
        /subscr_id=(?<subscr_id>.*)/ =~ res_val
        /residence_country=(?<residence_country>.*)/ =~ res_val
        /item_name=(?<item_name>.*)/ =~ res_val
        /payment_gross=(?<payment_gross>.*)/ =~ res_val
        /mc_currency=(?<mc_currency>.*)/ =~ res_val
        /business=(?<business>.*)/ =~ res_val
        /payment_type=(?<payment_type>.*)/ =~ res_val
        /protection_eligibility=(?<protection_eligibility>.*)/ =~ res_val
        /payer_status=(?<payer_status>.*)/ =~ res_val
        /payer_email=(?<payer_email>.*)/ =~ res_val
        /receiver_email=(?<receiver_email>.*)/ =~ res_val
        /first_name=(?<first_name>.*)/ =~ res_val
        /payer_id=(?<payer_id>.*)/ =~ res_val
        /receiver_id=(?<receiver_id>.*)/ =~ res_val
        /item_number=(?<item_number>.*)/ =~ res_val
        /payment_status=(?<payment_status>.*)/ =~ res_val
        /payment_fee=(?<payment_fee>.*)/ =~ res_val
        /mc_fee=(?<mc_fee>.*)/ =~ res_val
        /btn_id=(?<btn_id>.*)/ =~ res_val
        /mc_gross=(?<mc_gross>.*)/ =~ res_val
        /charset=(?<charset>.*)/ =~ res_val
        /test_ipn=(?<test_ipn>.*)/ =~ res_val

        logger.info res_val

          @pago = Pago.new

          @pago.tx = params[:tx]
          @pago.st = params[:st]
          @pago.amt = params[:amt]
          @pago.cc = params[:cc]
          @pago.cm = params[:cm]
          @pago.item_number = params[:item_number]
          @pago.sig = params[:sig]
          @pago.controller = params[:controller]
          @pago.action = params[:action]

          @pago.resultado = "SUCCESS"

          @pago.last_name = last_name
          @pago.transaction_subject = transaction_subject
          @pago.payment_date = payment_date
          @pago.payment_date_string = payment_date

          @pago.txn_type = txn_type
          @pago.subscr_id = subscr_id
          @pago.residence_country = residence_country
          @pago.item_name = item_name
          @pago.payment_gross = payment_gross
          @pago.mc_currency = mc_currency
          @pago.business = business
          @pago.payment_type = payment_type
          @pago.protection_eligibility = protection_eligibility
          @pago.payer_status = payer_status
          @pago.payer_email = payer_email
          @pago.receiver_email = receiver_email
          @pago.first_name = first_name
          @pago.payer_id = payer_id
          @pago.receiver_id = receiver_id
          @pago.item_number2 = item_number
          @pago.payment_status = payment_status
          @pago.payment_fee = payment_fee
          @pago.mc_fee = mc_fee
          @pago.btn_id = btn_id
          @pago.mc_gross = mc_gross
          @pago.charset = charset
          @pago.custom = custom
          @pago.create_botone_id = boton.id

          @pago.user_id=current_user.id unless current_user.nil?
	  @pago.host = request.host
	  @pago.remote_ip = request.remote_ip


          unless test_ipn.nil?
            @pago.sandbox = true if test_ipn == "1"
            if @pago.save
             logger.info "Se guardó bien el pago"
             return @pago
            end
          end


          logger.info "procesando la fecha"
          res_val = @pago.payment_date_string

          logger.info "string de entrada"
          logger.info res_val

         /(?<hora>\d{1,2})(.)(?<minuto>\d{1,2}):(?<segundo>\d{1,2}) (?<mes>\S{3})(.)(?<dia>\d{1,2})(.)\s(?<ano>\d{4})(.)(?<uso>\S{3})/=~ res_val

          logger.info "------------"

          logger.info hora
          logger.info minuto
          logger.info segundo
          logger.info mes
          logger.info dia
          logger.info ano
          logger.info uso
	  #me.zone = "Pacific Time (US & Canada)"
	  #-ime.zone.parse('8-11-2013 23:59:59') #=> Fri, 08 Nov 2013 23:59:59 PST -08:00
	  st= ano+"/"+mes+"/"+dia+" "+hora+":"+minuto+":"+segundo+" "+uso

          @pago.payment_date=st

          #te = @pago.payment_date_string
	  #ago.payment_date=I18n.l( DateTime.parse(date.localtime.to_s), :format => :evento)

     if @pago.save
      logger.info "Se guardó bien el pago"
      return @pago
     else
      return nil 
     end     
  end

  def empresa(environment)
=begin
https://developer.paypal.com/docs/classic/ipn/integration-guide/IPNIntro/#id08CKFJ00JYK
 receiver_email = gm_1231902686_biz@paypal.com	Check email address to make sure that this is not a spoo
=end
     empresa=nil
     if environment =="development" then
           empresa = "servidor@instrumentacion.mobi"
     elsif environment == "alectrico" or environment == "mobi" then
           empresa = "alexander.espinosa.hernandez@gmail.com"
     elsif environment == "sandbox" then
           empresa = "ventas@alectrico.com"
     else
       empresa = "alexander.espinosa.hernandez@gmail.com"
     end
     return empresa

  end


  def query(tx,pdt,environment)
   #prepara un query para solicitar más informacion sobre la transaccion tx
 
   respuesta = nil
   
   
   unless pdt.nil?
      str=nil

      if environment == "development" or environment == "sandbox"
        str = "https://" + "www.sandbox.paypal.com" + "/cgi-bin/webscr?cmd=_notify-synch&" + "tx=" + tx + "&" + "at=" + pdt
      elsif environment == "alectrico"
        str = "https://" + "www.paypal.com" + "/cgi-bin/webscr?cmd=_notify-synch&" + "tx=" + tx + "&" + "at=" + pdt
      else 
        str = "https://" + "www.paypal.com" + "/cgi-bin/webscr?cmd=_notify-synch&" + "tx=" + tx + "&" + "at=" + pdt
      end

      uri = URI.parse(str)

      unless str.nil?

         http= Net::HTTP.new(uri.host,uri.port)
         http.use_ssl=true
         request = Net::HTTP::Post.new(uri.request_uri)
         request.set_form_data({"content_type" => "application/x-www-form-urlencoded" })

         response = http.request(request)


         unless response.nil?     
           res_val = CGI.unescape(response.body)
=begin
	   -#if es_paypal(response.body,pdt,environment) no se usa aquí
	    es para ipn y yo uso pdt
	   PDT has a a major weakness: it sends order confirmations once and only once. As a result, when PDT sends a confirmation, your site must be running; otherwise, it will never receive the message.
=end
            res_val.force_encoding('ISO-8859-1')
            res_val.encode!('utf-8')
            respuesta = res_val
	 end

         #/charset=(?<charset>.*)/ =~ response.body

         #logger.info "Response:" + res_val

      end
    end

    return respuesta
  end


  def pdt(environment)
      
      pdt = nil
      if environment == "development" then
        pdt = "U3GJM43zW_lSOKfPgZK9JArcgLd7VEGLw48cWL9Yi5kwUBk7Ra_jsspKTSe"
      elsif environment == "sandbox" then
        pdt = "lIsDZdpPgLzhBtBDoVaPu3gUuBK6tHXN9V7cK673m7lsCibDKn528teJpjm"
      elsif environment== "alectrico" or sitio == "mobi"
        pdt = "Lr1cFlPxGs198uy878r0hvO8b6JJoFDRspXoufTTVSCYByBq7Y5RRIUp_Mi"
      end
    
      return pdt

  end

end
