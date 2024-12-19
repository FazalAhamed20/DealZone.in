class LoginController < ApplicationController
  
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
      redirect_to new_login_path, notice: "User not found"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to new_login_path, notice: "Logged out"

  end

  private
  def params_validate
    params.permit(:email, :password)
  end

end
