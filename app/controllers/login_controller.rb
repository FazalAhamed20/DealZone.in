class LoginController < ApplicationController
 before_action :redirect_if_logged_in, only: [ :create ]
  def create
    user = User.find_by(email: params_validate[:email])

    if user
      if user[:password] == params_validate[:password]
        session[:user_id] = user.id
        redirect_to products_path, notice: "Login successfull"
      else
              redirect_to new_login_path, notice: "Password incorrect"

      end
    else
      redirect_to new_login_path, notice: "User not found,please signup"
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to new_login_path, notice: "Logged out"
  end

  private
  def params_validate
    
    params.permit(:email, :password)
  end

  def redirect_if_logged_in
    if session[:user_id].present?
      redirect_to products_path, notice: "Already logged in"
    end
  end
end
