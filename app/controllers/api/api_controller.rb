module Api
  class ApiController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end

    def logged_in?
      !!current_user
    end

    def authorized
      render json: {message: "please login"} unless logged_in?
    end

    def warning_response(message)
      render json: { type: "warning", message: message }
    end
  end
end
