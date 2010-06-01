# encoding: utf-8
require "action_controller/metal"

module GitPit
  class Authentication

    def self.new(app, opts = {}, &block)

      # Failure App
      opts[:failure_app] = opts[:failure_app].to_s.classify.constantize if opts[:failure_app]
      opts[:default_strategies] = [opts[:defaults]].flatten if opts[:defaults]

      Warden::Manager.new(app, opts, &block)
    end

  end

  class FailureApp < ActionController::Metal

    include ActionController::RackDelegation
    include ActionController::Redirecting

    delegate :flash, :to => :request

    def self.call(env)
      action(:respond).call(env)
    end

    def respond
      redirect
    end

    def redirect
      flash[:alert] = unauthenticated_message unless flash[:notice]
      redirect_to '/'
    end

  protected

    def warden
      env['warden']
    end

    def warden_options
      env['warden.options']
    end

    def attempted_path
      warden_options[:attempted_path]
    end

    def unauthenticated_message
      if params[:username] && params[:password]
        "Login failed"
      else
        "You need to be logged in to access that page."
      end
    end

  end

end