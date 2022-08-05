class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    #To add the new input field in the registration form
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name, :user_id])
  end
end
