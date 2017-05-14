class Gestion::UsuarioMailer < ApplicationMailer

  default :from => Rails.configuration.domain['default_from']
  default :return_path => Rails.configuration.domain['default_from']
#  default :charset => "ISO-8859-1"

  def welcome_email1(usuario)
    @usuario = usuario
    email_with_name = %("#{@usuario.nombre}" <#{@usuario.email}>)
    @url = Rails.configuration.domain['name']
    mail(to: email_with_name, subject: "2728: Experiencia normativa")

  end

#users

  def welcome_visitante(user)
    @user = user
    email_with_name = %("" <#{@user.email}>)
    @sitio = Rails.configuration.domain['name']
    mail(to: email_with_name, subject: "Bienvenido")

  end

  def inscrito(user,rol,sitio )
    @url= Rails.configuration.x.domain['name']
    mail :to => 'instalaciones.alexsoft@gmail.com', :subject => "#{user.name} #{user.email} se ha inscrito en #{sitio} con el rol de #{rol}", :body => ""
  end


  def noti_visitante(user)
    @user = user
    email_with_name = %("" <#{@user.email}>)
    @sitio = Rails.configuration.domain['name']
    mail(to: Rails.configuration.domain['default_from'], subject: "Notificación de nuevo usuario en 2728")

  end

#eventos

  def evento_nuevo(user,evento,ingeniero)
    @ingeniero = ingeniero
    @evento = evento
    @user = user
    email_with_name = %("#{@user.name}" <#{@user.email}>)
    @sitio = Rails.configuration.domain['name']
    mail(to: email_with_name, subject: "Visita agendada")

  end

  def confirmacion_evento_nuevo(user,evento,ingeniero)
    @ingeniero = ingeniero.user
    @evento = evento
    @user = user
    @sitio = Rails.configuration.domain['name']
    ingeniero_with_name = %("#{@ingeniero.name}" <#{@ingeniero.email}>)
    mail(to: ingeniero_with_name, subject: "#{user.name} tiene una visita agendada con UD.")
  end



=begin
  def evento_nuevo(presupuesto,evento,cliente)

     @presupuesto = presupuesto
     @evento = evento
     @cliente = cliente
     @user = @cliente #para el layout de alectrico que tiene un link para cerrar la cuente de user

     @url= Rails.configuration.x.domain['name']
     mail :to => @presupuesto.admin.email, :subject => "#{@cliente.name} #{@cliente.email} ha fijado un evento para #{date_for_display(@evento.fecha)}", :template_path => 'user_mailer', :template_name => 'evento_nuevo.html.haml',:layout => 'alectrico_simple_mailer_layout'

  end
=end

#  def confirmacion_evento_nuevo(evento)
    #No corresponde unir registro en el mailer. prque se atrasan.
    # @presupuesto = Presupuesto.find_by_id(evento.presupuesto_id)
    # @evento = evento
    # if @presupuesto.user_id.nil?
     #   @user = @presupuesto.clientes.first
    # else
    #   @user=User.find_by_id(@presupuesto.user_id)
    # end
    # @url= Rails.configuration.x.domain['name']
#    dd
#     mail :to => @user.email, :subject => "Ud ha fijado un evento para #{date_for_display(evento.fecha)}"

 # end

#registros (empresa)

 
  def enviar_presentacion(empresa)
    @empresa = empresa
    if @empresa.nombre_fantasia
      nombre = @empresa.nombre_fantasia    
    else
     nombre = @empresa.razon_social
    end

    email_with_name = %("#{nombre}" <#{@empresa.email}>) 

    @url = Rails.configuration.domain['name']

    attachments['presentacion.pdf'] = File.read('app/views/gestion/usuario_mailer/presentacion.pdf')
    mail(to: email_with_name, subject: "2728: Experiencia normativa")

  end


end
