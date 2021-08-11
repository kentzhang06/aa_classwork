class UsersController < ApplicationController
  # def index
  #   @users = User.all
  #   render json: @users
  # end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render json: @user
    else
      render json: {error: 'User not found'}
    end
  end

  def create
    @user = User.new(params)

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

    if @user.update(params)
      redirect_to user_url(@user)
    else
      render json: {error: "Failed to update user"}
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user
      @user.destroy
      redirect_to user_url
    else
      render json: {error: "Failed to delete user"}
    end
  end

  private
  # def user_params
  #   params.require(:user).permit()
  # end
end