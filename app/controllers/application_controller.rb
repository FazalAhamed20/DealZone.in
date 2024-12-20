class ApplicationController < ActionController::Base
  helper_method :current_user_id
  allow_browser versions: :modern
  def current_user_id
    session[:user_id]
  end

end
