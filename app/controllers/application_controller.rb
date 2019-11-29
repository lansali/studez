class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :current_student
    helper_method :logged_in?

    before_action :authenticate_request

    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
    end

    def current_student
        if session[:user_id]
            @current_student ||= Student.where(user_id: session[:user_id]).first
        else
            @current_student = nil
        end
    end

    def logged_in?
        !current_user.nil?  
    end

    private

    def authenticate_request
        if !logged_in?
            redirect_to login_path, notice: "Log in first to get access!"
        end
    end
end
