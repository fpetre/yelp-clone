class Api::UsersController < ApplicationController

  def show
    @users = User.includes(:reviews).find(params[:id])
    render :show
  end

  def index
    @users = User.all.includes(:reviews)
    render :index
  end



end
