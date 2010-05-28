class SessionController < ApplicationController

  def create
    if warden.authenticate!
      store_user_handle(params[:username])
      redirect_to root_path, :notice => "You are now logged in."
    end
  end

  private
    def store_user_handle(handle)
      session[:user_handle] = handle
    end

end
