class UsersController < ApplicationController
  def index
    if params.has_key?(:username)
      @users = User.where('username LIKE ?', "%#{params[:username]}%")
    else
      @users = User.all
    end
    render json: @users
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: @user
    else
      render json: {error: 'User not found'}
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def update
    @user = User.find_by(id: params[:id])

    unless @user
      render json: {error: "There is no user with that id"}
      return
    end

    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render json:  @user.errors.full_messages, status:422
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user
      @user.destroy
      render json: @user
    else
      render json: {error: "Failed to delete user"}, status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end