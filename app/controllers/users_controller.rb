class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_request, only: [:new, :create]

  def index
    @users = User.paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    account_info = build_user_params(user_params, params[:user][:user_type])
    @user = User.new(account_info)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username, :first_name, :middle_name, :last_name)
    end
end
