class ElectricoController < ActionController::Base
 prepend_view_path 'app/views/electrico'

#layout 'curso_layout_application'
#protect_from_forgery

#es important eno borrar

#layout "static_pages_layout"
##layout "aplicacion_alectrico_layout"
#before_filter :items_cesta
#before_action :set_locale
before_filter :select_app



 
 alias oldto_s to_s
  
 def to_s(*args)
    
    oldto_s(*args) unless args.nils?
 end


  #escue_from User::NotAuthorized, with: :user_not_authorized
 


  #before_filter :prepare_for_mobile
  #before_filter :force_no_ssl
  #OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  include Electrico::SessionsHelper
  include Electrico::ApplicationHelper

  private

  def registrador
    if request.userAgent.match(/bot|spider/i)
       
    else

    end
  end
=begin
    if (navigator.userAgent.match(/bot|spider/i)) {
    #/ It is a bot. We might want to set some defaults here, or do nothing.
    } else {
     #  // It's not a bot! Hit the API
    $.get("http://ipinfo.io", function (response) {
       #// Log the response
        console.log(response);
    });
  } 
=end
#http://www.railway.at/2013/02/12/using-ssl-in-your-local-rails-environment/
  def force_ssl1(options = {})
    config = Rails.application.config

    return unless config.use_ssl # <= this is new

    host = options.delete(:host)
    port = config.ssl_port if config.respond_to?(:ssl_port) && config.ssl_port.present? # <= this is also new

    before_filter(options) do
      if !request.ssl?# && !Rails.env.development? # commented out the exclusion of the development environment
        redirect_options = {:protocol => 'https://', :status => :moved_permanently}
        redirect_options.merge!(:host => host) if host
        redirect_options.merge!(:port => port) if port # <= this is also new
        redirect_options.merge!(:params => request.query_parameters)
        redirect_to redirect_options
      end
    end
  end

def select_app
 #Esta era una buena idea cuando tenía el dominio de instrumentaicon.mobi
  #Cuando alguien escribiar https://instrumentacion.mobi y el servidor de DNS la redirigía hacia el hospedador, entonces, este recibia los requestes con este host especificado en request.host. 
  #O sea que yo podía ener dos dominios con el mismo sitio
 if request.host == 'alectrico.cl' and request.ssl?
   redirect_to 'http://alectrico.cl'  
 end

 if request.host == 'instrumentacion.mobi' and !request.ssl?
   redirect_to 'https://instrumentacion.mobi'
 end

  
end

def force_ssl

  if !request.ssl?
     redirect_to :protocol => 'https',:port =>  '443', :status => :moved_permanently,:host => "alectrico.cl"
  end
end


def force_no_ssl

  if request.ssl?

     redirect_to :protocol => 'http', :port => '80', :status => :moved_permanently, :host => "instrumentacion.mobi"
  end
end




def redirect_to_https
  redirect_to "https://localhost#{request.fullpath}" if !request.ssl?
  #&& request.host != "localhost"
end


  def user_not_authorized
     flash[:error] = "You don't have access to this section."
     redirect_to :back
   end




  def mobile_device?
    if session[:mobile_param] 
      session[:mobile_param] == "1"
    else
      request.user_agent =~ /Mobile|webOS/
    end
  end

  helper_method :mobile_device?

  def prepare_for_mobile
   session[:mobile_param] = params[:mobile] if params[:mobile]
   request.format = :mobile if mobile_device?
  end


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end


end


