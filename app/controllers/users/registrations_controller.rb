# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # Permitir parámetros adicionales durante el registro y actualización
  before_action :configure_sign_up_params, only: [ :create ]
  before_action :configure_account_update_params, only: [ :update ]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super do |resource|
      if resource.persisted?
        # Lógica adicional después de que el usuario se registre, si es necesario
      end
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  def cancel
    super
  end

  # La ruta utilizada después del registro exitoso
  def after_sign_up_path_for(resource)
    courses_path # Cambia esto a la ruta que desees
  end

  # La ruta utilizada después de la actualización de la cuenta
  def after_update_path_for(resource)
    courses_path # Cambia esto a la ruta que desees
  end

  protected

  # Si tienes parámetros adicionales para permitir, añádelos al sanitizador
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :surname ]) # Añade otros campos si es necesario
  end

  # Si tienes parámetros adicionales para permitir, añádelos al sanitizador
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :surname ]) # Añade otros campos si es necesario
  end
end
