class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permite atributos adicionales para el registro
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :surname ]) # Agrega otros atributos si es necesario
    # Permite atributos adicionales para la actualización de cuenta
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :surname ])
  end
end
