class Api::SessionsController < ApplicationController

    def create
      username = session_params[:username]
      password = session_params[:password]
      user = User.find_by_credentials(username, password)
      if user
        if user.save
          login(user)
          render :json => user
        else
          flash.now[:errors] = user.errors.full_messages
          render :json => user.errors, status: :unprocessable_entity
        end
      else
        render :json => "invalid username or password", status: :unprocessable_entity
    end
  end

    def destroy
      logout
      render :json => {success: "successfully logged out"}
    end

    private
    def session_params
      params.require(:session).permit([:username, :password])
    end
end
