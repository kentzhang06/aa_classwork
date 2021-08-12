class UsersController < ApplicationController
  def index
    @users = User.all
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
    @user = User.new(params.require(:user).permit(:username, :email))

    if @user.save
      redirect_to user_url(@user)
    else
      render json: {error: 'User not created'}
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
      render json: {error: "Failed to update user"}
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user
      @user.destroy
      redirect_to users_url
      # render json: @user
    else
      render json: {error: "Failed to delete user"}, status: 404
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email)
  end
end