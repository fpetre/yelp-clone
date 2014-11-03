class Api::UsersController < ApplicationController

  def show
    @user = User.includes(:reviews => :business).find(params[:id])
    render :show
  end

  def index
    @users = User.all.includes(:reviews => :business)
    render :index
  end



end
