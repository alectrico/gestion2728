
###require "RMagick"

class FacebookController < ElectricoController
#before_filter :authenticate_user!
before_filter :correct_client, only: [:login]

layout 'nomenu', only: [:login,:profile,:producto]
#layout :false, only: [:producto,:graph]
#before_filter :signed_in_user, except: [:login,:profile]
#before_filter :not_signed_in_user, only: [:login]
#App_name = "dos"
#App_id="1662062020776676"
#App_secret="2a695ebb05d7bced9f444357492ea236"
#App_name = "alectrico"
#App_id="177788662249021"
#App_secret="e23ceb738fe3beee245afdf5f8790093"

App_name = "alectrico - Test1"
App_id="1778152122452471"
App_id=Domain.get_fb_app_id
App_secret = Domain.get_fb_app_secret

def index
    unless current_user.facebook_oauth_setting
        @oauth = Koala::Facebook::OAuth.new(App_id,App_secret, "http://#{request.host}:#{request.port}/callback")
        session["oauth_obj"] = @oauth
        redirect_to @oauth.url_for_oauth_code
    else
        redirect_to "/facebook/profile"
    end
end

def get_access_token
    if current_user
       current_user.facebook_oauth_setting.destroy! if current_user.facebook_oauth_setting

       @oauth = Koala::Facebook::OAuth.new(App_id,App_secret, "http://#{request.host}:#{request.port}/callback")
        session["oauth_obj"] = @oauth
        redirect_to @oauth.url_for_oauth_code
    else
      redirect_to signin_url
    end
end


def callback
  unless current_user.facebook_oauth_setting
        @oauth = session["oauth_obj"]
        #token = @oauth.get_access_token(params[:code])

        token = Koala::Facebook::OAuth.new(App_id, App_secret, "http://#{request.host}:#{request.port}/callback").get_access_token(params[:code])


        FacebookOauthSetting.create({:access_token => token, :user_id => current_user.id})

        begin
          redirect_to "/profile"
        rescue
          redirect_to signin_url
        end
  
    else
        redirect_to root_url
    end
end


def profile
  @app_name = App_name
  @app_id = App_id
  @app_secret = App_secret 
  if current_user and current_user.facebook_oauth_setting
        @access_token = current_user.facebook_oauth_setting.access_token
	#@access_token = "EAACEdEose0cBAD2oTD8IrssQ3raoQ8ACfOY5oI0ZCS4RhLQ5LJh2NmvLpcvEUQEUwvAQlGh6Aim5wIpw41rhoZCTXnAzLvfJHzKqXof9cxodlcBzs0Wj64tbJAEs7BDr9c8qyrPk9eF8nUBEASoPubAx4J2JZCINbe4ZCjiM2gZDZD"
	@setting = current_user.facebook_oauth_setting
        @graph = Koala::Facebook::API.new(@access_token)
	begin
          @profile = @graph.get_object("me")
          @picture = @graph.get_picture("me")
          @feed = @graph.get_connections("me","feed")
          @friends = @graph.get_connections("me", "friends")
        rescue Exception => e 
	  @friends = []
          @error = e
        end
    else
        redirect_to '/facebook/login'
    end
end


def login
   
=begin
svg_string='
<svg xmlns="http://www.w3.org/2000/svg"  width="120" height="120" viewPort="0 0 120 120" version="1.1">
  <rect width="150" height="150" fill="rgb(0, 255, 0)" stroke-width="1" stroke="rgb(0, 0, 0)" />
  <line x1="20" y1="100" x2="100" y2="20" stroke="black" stroke-width="2"/>
</svg>'

   img = Magick::Image.from_blob(svg_string) {
    self.format = 'SVG'
    self.background_color = 'transparent'
}
   img.write "example_out.png"
   
=end
   @app_id = App_id
   unless current_presupuesto
     @presupuesto = Presupuesto.new
     ingresar_a_presupuesto(@presupuesto)
   else
     @presupuesto = current_presupuesto
     ingresar_a_presupuesto(@presupuesto)
   end
end

def correct_client
 @presupuesto = current_presupuesto
 cliente = @presupuesto.clientes.first unless @presupuesto.nil?
 cliente= User.find_by_id(@presupuesto.user_id) unless @presupuesto.nil?
 if signed_in? and !current_user.admin?
   if (cliente.nil? or cliente.id != current_user.id)
      redirect_to root_path, notice: "Lo siento pero este no es su presupuesto, o Ud no tiene presupuesto, o no es cliente de #{Domain.empresa}."
   end
 end

 end


end


