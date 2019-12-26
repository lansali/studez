class ApplicationController < ActionController::Base
    include ApplicationHelper

    helper_method :current_user
    helper_method :current_student
    helper_method :current_employer
    helper_method :logged_in?
    helper_method :get_current_user_roles
    helper_method :notifications

    before_action :authenticate_request

    DB_USER_ROLES = ['admin', 'business', 'student', 'moderator'].freeze

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

    def get_current_user_roles
        return if !logged_in?
        current_user_roles = []
        
        DB_USER_ROLES.each do |type|
            if current_user.send(type) == true
                current_user_roles << type
            end
        end
        return current_user_roles
    end

    private

    def authenticate_request
        if !logged_in?
            redirect_to login_path, notice: "Log in first to get access!"
        end
    end
end
