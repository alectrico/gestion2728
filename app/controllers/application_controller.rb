include Gestion::SessionsHelper


class ApplicationController < ActionController::Base
 # before_action :configure_permitted_parameters, if: :devise_controller?
 # layout 'layouts/devise'




 # layout :layout_de_aplicacion
  protect_from_forgery with: :exception

protected

  #def configure_permitted_parameters
  #  devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #    user_params.permit( :role, :email,:password,:password_confirmation,:auditor)
 #   end

  #  devise_parameter_sanitizer.permit(:sign_in) do |user_params|
  #    user_params.permit(:email,:password,:remember_me, :role)
  #  end


# end

private
 #No puedo usar esto, porque los controladores subordinados van directo a usar el layout especificado aquí sin ver sus propios layouts
  def layout_de_aplicacion
    "application_" + Rails.configuration.domain['focus'].to_s
  end


end
