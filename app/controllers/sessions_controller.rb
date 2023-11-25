class SessionsController < ApplicationController
  def new; end

  def create
    return warning_message("User doesn`t exist") unless user.present?
    return warning_message("Password is not match") unless user.authenticate(session_param[:password])

    session[:user_id] = user.id
    redirect_to root_path, flash: { type: :success, message: "Logged in successfully"}
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user
    @user = User.find_by(username: session_param[:username])
  end

  def session_param
    params.require(:user).permit(:username, :password)
  end
end
