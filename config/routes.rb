GestionSite::Application.routes.draw do

#================= ELECTRICO ==========
 

#mas paginas estaticas=========================
namespace :curso do
  get '/help', to: 'static_page#help'
  #get '/', to: 'static_page#home'
  get '/about', to: 'static_page#about'
  get '/contact', to: 'static_page#contact'
  get '/clases', to: 'static_page#clases'
end


  #root to: 'static_page#home'
 #==================  páginas estáticas
  namespace :curso do
      get "static_page/modal"
      get "static_page/home"
      get "static_page/help"
      get "static_page/about"
      get "static_page/contact"
      get "static_page/clases"
      get "static_page/express"
      get "static_page/evaluaciones"
     #get "static_page/cursos"
  end

  scope module: 'curso' do
      get "static_page/modal"
      get "static_page/home"
      get "static_page/help"
      get "static_page/about"
      get "static_page/contact"
      get "static_page/clases"
      get "static_page/express"
      get "static_page/evaluaciones"
      get "static_page/whatsapp"
      #get "static_page/cursos"
  end


  #hacer que la ubicacioon en controller/curso aparezca en controller.
  #De esta forma no nes necesario modificar los helper/path
  scope module: 'curso' do

    resources :enrolamientos
    resources :participantes

    resources :ediciones do
      resources :videos
    end

    resources :modulos
    resources :objetivos
    resources :contenidos
    resources :temas
    resources :pruebas
    resources :tipos
    #resources :tipopreguntas obsoleto
    resources :alternativas
    resources :preguntas
    #resources :preguntas do
     # resources :alternativas
    #end

    resources :examenes
    resources :respuestas

    post "/evaluar", to: 'examenes#evaluar'
    #esources :documentos obsoleto
    resources :partes

  end


  #De esta forma no nes necesario modificar los helper/path
  namespace :curso do

    resources :enrolamientos
    resources :participantes

    resources :ediciones do
      resources :videos
    end

    resources :modulos
    resources :objetivos
    resources :contenidos
    resources :temas
    resources :pruebas
    resources :tipos
    #resources :tipopreguntas obsoleto
    resources :alternativas
    resources :preguntas
    #resources :preguntas do
     # resources :alternativas
    #end

    resources :examenes
    resources :respuestas

    post "/evaluar", to: 'examenes#evaluar'
    #esources :documentos obsoleto
    resources :partes

  end

  
  #
  #
=begin
scope module: 'electrico' do
  resources :users do
    member do
      get :following, :followers,:bienvenida,:miembro, :no_miembro, :contactar_usuario
      get :resume
    end
   end
end

=end
namespace :electrico do 
  resources :users
end


#============== GESTION =======================  

  scope module: 'gestion' do
     resources :tipo_auditorias do
       member do
         get 'download_pdf'
       end
     end
   end
  namespace :gestion do
    resources :tipo_auditorias
  end
  scope module: 'gestion' do
     resources :atenciones do
       member do
         get 'download_pdf'
       end
     end
   end
  namespace :gestion do
    resources :atenciones
  end
  scope module: 'gestion' do
     resources :eventos do
       member do
         get 'download_pdf'
       end
     end
   end
  namespace :gestion do
    resources :eventos
  end
#------ Gestion ---------------------------------------

  get '/bienvenida',     to: 'gestion/album#index'
  get '/contacto',       to: 'gestion/album#contacto'
  get '/about',            to: 'gestion/album#about'
  #get '/work',          to: 'gestion/dashboard#index'
  get '/gestion',        to: 'gestion/registros#index'
  #get '/presupuestos',   to: 'presupuesto/fotos#index'
  root to: 'gestion/album#index' if Rails.configuration.domain['focus'] == 'gestion'
  root to: 'gestion/album#index' if Rails.configuration.domain['focus'] == 'alectrico'
#root es la ruta de inicio de los visitatnes del focus gestion

# user_root to: '/presupuestos' if Rails.configuration.domain['focus'] == 'gestion'
#user_root es la ruta de inicio de los usuarios de gestion

 #admin_root to: '/gestion' if Rails.configuration.domain['focus'] == 'gestion'
#user_root es la ruta de inicio de los usuarios administradores de gestion


#----------------------------------------------------------------------------------



  #et '/rails/mailers/gestion/usuario_mailer/enviar_presentacion'
  #et '/rails/mailers/gestion/usuario_mailer/welcome_email'
  #et '/rails/mailers/gestion/usuario_mailer'
  #et '/rails/mailers'
  

  scope module: 'gestion' do
    resources :evidencias,:usuarios do
      member do
        get 'download_pdf'
        get 'code_image'
      end
    end
  end
  namespace :gestion do
    resources :evidencias,:usuarios
  end

  scope module: 'gestion' do
    resources :criterios,:auditorias do
      member do
        get 'download_pdf'
      end
    end
  end
  namespace :gestion do
    resources :criterios,:auditorias
  end

  namespace :users do
    resources :sessions
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations',
  } 

  scope module: 'presupuesto' do
     resources :fotos do
       member do
	 get 'code_image'
         get 'download_pdf'
       end
     end
   end

  namespace :presupuesto do
    resources :fotos
  end

  scope module: 'gestion' do
     resources :registros do
       member do
	 get 'enviar_presentacion'
         get 'download_pdf'
       end
     end
   end
  namespace :gestion do
    resources :registros
    
  end
=begin
  resources :components
   scope module: 'components' do
    resources :alerts, :badge,:breadcrumb,'button_group',:buttons,:card,:carousel,:collapse,:dropdowns,:forms,'input_group',:jumbotron,'list_group', :modal, :navbar,:navs,:pagination,:popovers,:progress,:scrollspy,:tooltips
  end



 # root to: 'boostrap/starter_template#index'

  get '/carousel1',  to: 'bootstrap/carousel#index'
  get '/jumbotron1', to: 'bootstrap/jumbotron#index'
  get '/navbar1',    to: 'bootstrap/navbars#index'


  resources :bootstrap
  scope module: 'bootstrap' do
    resources :album,:blog,:carousel,:cover,:dashboard,:grid,:jumbotron,:justified_nav,:navbars,:offcanvas,:signin,:starter_template,:navbar_top,:navbar_top_fixed,:sticky_footer,:sticky_footer_navbar,:tooltip_viewport,:narrow_jumbotron
  end

=end
end
