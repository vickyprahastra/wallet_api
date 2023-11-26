module Api
  class SessionsController < Api::ApiController
    skip_before_action :verify_authenticity_token

    def new
      render json: {message: "welcome"}
    end

    def create
      return warning_response("User doesn`t exist") unless user.present?
      return warning_response("Password is not match") unless user.authenticate(session_param[:password])

      session[:user_id] = user.id
      render json: {message: "Successfully logged in"}
    end

    def destroy
      session[:user_id] = nil
      render json: {message: "Successfully logout"}
    end

    private

    def user
      @user = User.find_by(username: session_param[:username])
    end

    def session_param
      params.require(:user).permit(:username, :password)
    end
  end
end
