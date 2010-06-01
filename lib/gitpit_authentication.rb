# encoding: utf-8
require "action_controller/metal"

module GitPit

  class FailureApp < ActionController::Metal

    include ActionController::RackDelegation
    include ActionController::Redirecting

    delegate :flash, :to => :request

    def self.call(env)
      action(:redirect).call(env)
    end

    def redirect
      flash[:alert] = unauthenticated_message
      redirect_to '/'
    end

  protected

    def unauthenticated_message
      if params[:username] and params[:password]
        "Login failed"
      else
        "You need to be logged in to access that page."
      end
    end

  end

end
