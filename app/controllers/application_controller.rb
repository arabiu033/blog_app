class ApplicationController < ActionController::Base
  # add_flash_types :info, :error, :success
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end
