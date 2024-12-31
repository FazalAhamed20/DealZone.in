class ApplicationController < ActionController::Base
  helper_method :current_user_id

  # before_action :log_csrf_token

  def current_user_id
    current_user.id
  end
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
       end

  #  def log_csrf_token
  #   puts "CSRF Token: #{session[:_csrf_token]}"
  # end
end
