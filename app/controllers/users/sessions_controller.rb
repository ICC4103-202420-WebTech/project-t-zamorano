# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end
end
