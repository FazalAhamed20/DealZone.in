class ApplicationController < ActionController::Base
  helper_method :current_user_id
  helper_method :logged_in
  allow_browser versions: :modern
  def current_user_id
    session[:user_id]
  end
  def logged_in
    unless session[:user_id].present?
      redirect_to new_login_path, notice: "Please login to view products"
    end
  end
end
