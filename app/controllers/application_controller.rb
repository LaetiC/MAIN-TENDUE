class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :body_class
  before_action :configure_permitted_parameters, if: :devise_controller?

  def body_class
    @body_class = "body-requests" if params[:controller] == "requests"
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :role, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :role, :photo])
  end
end
