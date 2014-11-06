class SessionsController < ApplicationController
  before_action :require_signed_in!, only: [:destroy]
  before_action :require_signed_out!, only: [:new, :create]

  def new
    render :new
  end

  def create
    username = session_params[:username]
    password = session_params[:password]
    user = User.find_by_credentials(username, password)
    if user
      if user.save
        login(user)
        redirect_to user_url(user)
      else
        flash.now[:errors] = user.errors.full_messages
        render :new
      end
    else
      flash.now[:errors] = ["invalid username or password"]
      render :new
  end
end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit([:username, :password])
  end
end
