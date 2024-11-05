# app/controllers/users/passwords_controller.rb
class Users::PasswordsController < Devise::PasswordsController
  # Permitir parámetros adicionales durante la recuperación de contraseña
  before_action :configure_password_params, only: [ :update ]

  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    super
  end

  # PUT /resource/password
  def update
    super
  end

  protected

  # Si tienes parámetros adicionales para permitir, añádelos al sanitizador
  def configure_password_params
    devise_parameter_sanitizer.permit(:password_change, keys: [ :name, :surname ]) # Añade otros campos si es necesario
  end
end
