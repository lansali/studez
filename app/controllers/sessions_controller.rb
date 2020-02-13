class SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def new
  end

  def create
    result = UserSession.call(email: params[:email], password: params[:password])

    return redirect_to login_url, notice: result.error if result.failure?

    session[:user_id] = result.authenticated_user.id
    redirect_to root_url, notice: result.message
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
