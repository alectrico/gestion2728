#encoding: UTF-8
=begin
Generating URLs

URLs can be generated in mailer views using url_for or named routes. Unlike controllers from Action Pack, the mailer instance doesn't have any context about the incoming request, so you'll need to provide all of the details needed to generate a URL.

  When using url_for you'll need to provide the :host, :controller, and :action:

  <%= url_for(host: "example.com", controller: "welcome", action: "greeting") %>
  When using named routes you only need to supply the :host:

  <%= users_url(host: "example.com") %>
  You should use the named_route_url style (which generates absolute URLs) and avoid using the named_route_path style (which generates relative URLs), since clients reading the mail will have no concept of a current URL from which to determine a relative path.

  It is also possible to set a default host that will be used in all mailers by setting the :host option as a configuration option in config/application.rb:

  config.action_mailer.default_url_options = { host: "example.com" }
  When you decide to set a default :host for your mailers, then you need to make sure to use the only_path: false option when using url_for. Since the url_for view helper will generate relative URLs by default when a :host option isn't explicitly provided, passing only_path: false will ensure that absolute URLs are generated.
=end

class Curso::UserMailer < ActionMailer::Base
#elper Curso::Events
include Gestion::EventsHelper

if Rails.env.alectrico? or Rails.env.sandbox? or Rails.env.alectrico_heroku? or Rails.env.electrico_heroku?
  layout 'alectrico_mailer_layout'
  #layout 'alectrico_simple_mailer_layout'

  default :from => Rails.configuration.x.domain['default_from']
  default :from => '"Alectrico" <ventas@alectrico.com>'
  default :return_path => 'ventas@alectrico.com'
else
  layout 'user_mailer_layout'
  default :from => "instrumentacion.curso@gmail.com"
end


/
ActionView::Template::Error (Missing host to link to! Please provide the :host parameter, set default_url_options[:host], or set :only_path to true):
/


if Rails.env.presupuesto? then
  @url= Rails.configuration.x.domain['name']
  default  :from => "alleph@icloud.com" #da error spf
#default :from  => "info@instrumentacion.mobi" 
end




  def password_resets(user)
    @user = user
    @url= Rails.configuration.x.domain['name']
    mail :to => user.email,:subject => "Reiniciación de Password".encode("UTF-8")    
  end

  def follow(other_user, user)
    @user = user
    @other_user = other_user
    @url= Rails.configuration.x.domain['name']

    mail :to => other_user.email, :subject => "'#{user.name}' ha comenzando a seguirlo"
  end

  def welcome_visitante(user,rol,sitio)
    @user = user
    @rol = rol
    @sitio = sitio
    @url= Rails.configuration.x.domain['name']

    mail :to => @user.email, :subject => "Bienvenido, UD participa en #{@sitio} con el rol de #{@rol}"
  end

  def welcome_curso(user,rol,sitio)
    @user = user
    @rol = rol
    @sitio = sitio
    @url= Rails.configuration.x.domain['name']

    mail :to => @user.email, :subject => "Bienvenido, UD participa en #{@sitio} con el rol de #{@rol}"
  end

  def welcome_alectrico(user,rol,sitio)
   @user = user
   @rol = rol
   @sitio = sitio
   @url= Rails.configuration.x.domain['name']

   mail :to => @user.email, :subject => "Bienvenido, UD participa en #{@sitio} con el rol de #{@rol}"
  end



  def inscrito(user,rol,sitio )

    @url= Rails.configuration.x.domain['name']
    mail :to => 'instalaciones.alexsoft@gmail.com', :subject => "#{user.name} #{user.email} se ha inscrito en #{sitio} con el rol de #{rol}", :body => ""
  end
  def evento_nuevo(presupuesto,evento,cliente)

     @presupuesto = presupuesto
     @evento = evento
     @cliente = cliente
     @user = @cliente #para el layout de alectrico que tiene un link para cerrar la cuente de user

     @url= Rails.configuration.x.domain['name']
     mail :to => @presupuesto.admin.email, :subject => "#{@cliente.name} #{@cliente.email} ha fijado un evento para #{date_for_display(@evento.fecha)}", :template_path => 'user_mailer', :template_name => 'evento_nuevo.html.haml',:layout => 'alectrico_simple_mailer_layout'

  end


 def confirmacion_evento_nuevo(evento)
     @presupuesto = Presupuesto.find_by_id(evento.presupuesto_id)
     @evento = evento
     if @presupuesto.user_id.nil?
        @user = @presupuesto.clientes.first
     else
       @user=User.find_by_id(@presupuesto.user_id)
     end
     @url= Rails.configuration.x.domain['name']     
     mail :to => @user.email, :subject => "Ud ha fijado un evento para #{date_for_display(evento.fecha)}", :template_path => 'user_mailer', :template_name => 'confirmacion_evento_nuevo.html.haml'


 end


  def enrolamiento(user)

    @url= Rails.configuration.x.domain['name']
    mail :to => 'instalaciones.alexsoft@gmail.com', :subject => "#{user.name} #{user.email} se ha enrolado en un módulo de un curso",:body => ""

  end


  def twit(user,sender)
    
      @user = user
      @sender = sender
      @url= Rails.configuration.x.domain['name']

      mail  :to => @user.email, :subject => "Comentario publicado"
    # :subject => @sender.microposts.first.content[1,30]+"..."
  end


  def welcome_email(user,rol,sitio)

    @user = user
    @url= Rails.configuration.x.domain['name']
    mail :to => user.email, :subject => "Bienvenido, UD participa en #{sitio} con el rol de #{rol}"
  end




  def curriculum_mail(cv,current_user,fotos)
    @cv = cv
    @destinatario= User.find_by_email(cv.para_email)
    @url= Rails.configuration.x.domain['name']
    @user = current_user
    @fotos = fotos
    @nombre= ""
    begin
      @nombre = @destinario.name
    rescue
    end

    #attachments['corel002.png']=File.read('corel002.png')
    if Foto.exists?(@cv.foto_id) then
      @image = Foto.find_by_id(@cv.foto_id)
      #attachments.inline[@image.nombre_archivo]= @image.bits

      directory = "public/assets"
      directory = config.x.domain["dir_imagenes_cvs"]
      name = @image.nombre_archivo
      path = File.join(directory, name)

     File.open(path, "wb"){ |f| f.write(@image.bits) }
   end



    #temp_file = Tempfile.new @imagen.nombre_archivo, "#{Rails.root}/public/assets/"
    #temp_file.puts @imagen.bits

    #open("https://www.instrumentacion.mobi/#{code_image_foto_path(@imagen)}", 'User-Agent' => 'Test').read
    #mimetype = `file -ib #{temp_file.path}`.gsub(/\n/,"")




    mail  :to => "#{@cv.para_email}" ,:subject => "Estimado(a)#{@nombre} le adjunto el curriculum de #{@user.name} ", :template_path => 'cvs',:template_name => "show.html.haml"



  end






  def presupuestomail(p,user) #esta version está en uso activc
   
    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name'] 

    attachments['presupuesto.pdf']=File.read("app/views/presupuestos/#{p.formato_pdf}")

    p.attachments.each do |at|
     attachments.inline[at.filename.gsub(/(\S*)presupuestos\//,"")]=File.read(at.filename)
    end

     mail  :to => "#{@user.email}" ,:subject => "'#{@user.name}' adjunto presupuesto pedido", :template_path => 'presupuestos',:template_name => "#{p.formato_web}"

  end






  def presupuesto(p,user) #esta version está en uso activc

    @presupuesto=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end



    if @presupuesto.croquis
      asset_url = "http://" +@url + "/public/assets/"
      croquis ="'"+ asset_url +  Foto.find_by_id(@presupuesto.croquis_foto_id).nombre_archivo + "'"
      logger.info "Direccion del croquis es"
      logger.info croquis
      @presupuesto.attachments.each do |at|
        attachments[at.filename]=File.read(at.filename)
      end
    end

   #logger.info "attachments"
   # @presupuesto.attachments.each do |at|
   #  logger.info at.filename
   #  attachments.inline[at.filename.gsub(/(\S*)presupuestos\//,"")]=File.read(at.filename)
  #  end
    #
    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "'#{@user.name}' adjunto presupuesto pedido", :template_name => "presupuesto"

  end



  def explicacion(p,user) #esta version está en uso activc

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

#    attachments.inline['corel002.png']=File.read('corel002.png')
    @url= Rails.configuration.x.domain['name']

    name='app/views/user_mailer/explicacion.pdf'
    directory = Rails.root

    path = File.join(Rails.root,'app','views','user_mailer','explicacion.pdf')

    attachments['explicacion.pdf']=File.read(path)

    mail( :to => "#{@user.email}" ,:subject => "'#{@user.name}' adjunto explicacion técnica de levantamiento", :template_name => "explicacion.html.erb")


  end



  def manual(p,user) 

    @presupuesto=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    attachments['manual.pdf'] = File.read("app/views/user_mailer/manual.pdf")
#   attachments.inline['manual.pdf']=File.read("app/views/user_mailer/manual.pdf")

   '"Name" <me@email.com>'
    mail  :to => """#{@user.name}"" <#{@user.email}>" ,:subject => "#{@user.name}, su Manual de Usuario", :template_name => "manual.html.haml"

  end





  def mano_de_obra_y_materiales(p,user) #esta version está en uso activc

    @presupuesto=p
    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']


    mail  :to => "#{@user.email}" ,:subject => "★ #{@user.name}, su presupuesto #{@presupuesto.id}", :template_name => "mano_de_obra_y_materiales"

    #ail  :to => "#{@user.email}" ,:subject => "★ #{@user.name}, su presupuesto #{@presupuesto.id}", :template_name => "materiales"


  end


  def datos_fondo(p,user) #esta version está en uso activc

    @presupuesto=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "★ #{@user.name}, datos para transferencia de fondos", :template_name => "datos_fondo"

  end




  def materiales(p,user) #esta version está en uso activc

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "★ #{@user.name}, su lista de materiales", :template_name => "materiales"

  end





  def enviar_cien_mil(p,user) 

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "Descuento por pronta contratación, #{@user.name}", :template_name => "enviar_cien_mil"

  end

  #invita al usuario a que agende una visita
  def full_test(p,user)
    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "Inspección Eléctrica: Full Test, #{@user.name}" 

  end


  def contacto(p)

    @p=p
    @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    @presupuesto = p
    mail(:to => user.email ,:subject => "¡ ★  Visita eléctrica ★ ! #{user.name.truncate_words(1)}", :template_name => "ano_nuevo") do |format|
      format.html {render :layout => 'alectrico_simple_mailer_layout'}
    end

end


  def ano_nuevo(p,user)

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    @user = user
    @presupuesto = p
    mail(:to => user.email ,:subject => "¡ ★ ★  Feliz 2016 ★ ★ ★ !! #{user.name.truncate_words(1)}", :template_name => "ano_nuevo") do |format|
      format.html {render :layout => 'alectrico_simple_mailer_layout'}
    end

end

  def levantamiento(p,user) #esta version está en uso activc

    @presupuesto=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "★ #{@user.name}, su levantamiento eléctrico", :template_name => "levantamiento"

  end





  def buy_datos(p,user)

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "★ Invitación de Instalaciones Alexsot", :template_path => 'presupuestos'

  end



  def buy_citofonia(p,user)

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "★ Invitación de Instalaciones Alexsot", :template_path => 'presupuestos'

  end



  def buy_electricidad(p,user) 

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "★ Invitación de Instalaciones Alexsot", :template_path => 'user_mailer'

  end



  #invita al usuario a que agende una visita
  def agendar_visita(p,user)
    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name']

    mail  :to => "#{@user.email}" ,:subject => "¡ ★  Visita eléctrica ★ !", :template_path => 'user_mailer'

  end



  def buy_control(p,user)

    @p=p
    if user.nil?
      @user = User.find_by_id(p.user_id) unless !User.exists?(p.user_id)
    else
      @user = user
    end

    if @user.nil?
      @user = p.clientes.first
    end

    @url= Rails.configuration.x.domain['name'
    ]
    mail  :to => "#{@user.email}" ,:subject => "Invitación de Instalaciones Alexsot", :template_path => 'presupuestos'

  end

 


  def scribd(user)
    @user = user
    @url= Rails.configuration.x.domain['name']

    mail :to =>@user.email, :subject => "Scribd disponible", :template_path => 'campanas', :template_name => 'scribd.html.haml'
  end



  def paypal(user)
    @user = user

    @url= Rails.configuration.x.domain['name']

    mail :to =>@user.email, :subject => "Textos online", :template_path => 'campanas', :template_name => 'paypal.html.haml'
  end





  def amazon(user)
    @user = user
    @url= Rails.configuration.x.domain['name']    
    mail :to =>@user.email, :subject => "Amazon CountDown Deals", :template_path => 'campanas', :template_name => 'amazon.html.haml'

  end







#envio aviso de solo texto
  def inicio_sesion(user)
    @user = user   
    @url= Rails.configuration.x.domain['name']
    mail :to => 'instalaciones.alexsoft@gmail.com',
         :body => "",
         :content_type => "text/html",        
         :subject => "'#{@user.name}' (#{@user.email}) ha iniciado sesion en el curso"
  end

end
