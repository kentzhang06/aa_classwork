class UsersController < ApplicationController
  # before_action :require_logged_out, only: [:new, :create]
  # before_action :require_logged_in, only: [:destroy]

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :session_token)
  end
end
