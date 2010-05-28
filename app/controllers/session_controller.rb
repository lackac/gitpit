class SessionController < ApplicationController

  def create
    if PivotalTracker::Client.token(params[:username], params[:password])
      store_user_handle(params[:username])
      redirect_to root_path, :notice => "You are now logged in."
    end
  end

  private
    def store_user_handle(handle)
      session[:user_handle] = handle
    end

end
