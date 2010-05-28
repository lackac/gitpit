class SessionController < ApplicationController

  skip_before_filter :authenticate_with_warden, :only => [:new, :create]

  def create
    if warden.authenticate!
      store_user_handle(params[:username])
      redirect_to root_path, :notice => "You are now logged in."
    end
  end

  def destroy
    warden.logout
    PivotalTracker::Client.token = nil
    redirect_to login_path, :notice => "You have been logged out."
  end

  private
    def store_user_handle(handle)
      session[:user_handle] = handle
    end

end
