class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show
    else
      render :json => {error: @user.errors.full_messages},
        :status => :unprocessable_entity
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render :show
    else
      render :json => {error: @user.errors.full_messages},
        :status => :unprocessable_entity
    end
  end

  def show
    @user = User.includes(:reviews => :business).find(params[:id])
    render :show
  end

  def index
    @users = User.all.includes(:reviews => :business)
    render :index
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
