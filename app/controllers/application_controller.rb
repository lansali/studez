class ApplicationController < ActionController::Base
    include ApplicationHelper

    helper_method :current_user,
                  :current_student,
                  :current_employer,
                  :logged_in?,
                  :notifications

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

    def current_employer
        if session[:user_id]
            @current_employer ||= Employer.where(user_id: session[:user_id]).first
        else
            @current_employer = nil
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
