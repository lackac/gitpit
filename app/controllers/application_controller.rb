class ApplicationController < ActionController::Base
  protect_from_forgery

  layout 'application'

  def authenticate_with_warden
    warden.authenticate!
  end

  private
    def warden
      env['warden']
    end

end
