class SignupController < ApplicationController

  def new
    @user = User.new()

  end
  def create
    exist_user = User.find_by(email: params_validate[:email])
    if exist_user
      redirect_to new_signup_path, notice: "User already exist"
    else
      @user = User.new(params_validate)
      if @user.save
        redirect_to new_login_path, notice: "Signup Successfull,Now login"
      else
        redirect_to new_signup_path, notice: "Signup Unsuccessfull"
      end

    end
  end
  
  private

  def params_validate
    params.permit(:name, :email, :password)
  end
  
end
