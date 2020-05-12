# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout "logfile" , only: [:new]
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   def new
    super
   end

  # POST /resource/sign_in
   def create
     super
     current_user.remember_me! if params[:user][:remember_me]
     # this helps me to login for specific period of time
   end

  # DELETE /resource/sign_out
   def destroy
     super
   end

   protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:password , :remember_me])
   end

   def after_sign_in_path_for(resource)
    homepage_home_path
   end
end
