module ApplicationHelper
  def flash_messages
    unless flash.empty?
      render :partial => "shared/flashes"
    end
  end

  def google_ajax_cdn(lib = "jquery-1.4")
    if Rails.env.production?
      lib, version = lib.split("-")
      "http://ajax.googleapis.com/ajax/libs/#{lib}/#{version}/#{lib}.min.js"
    else
      lib
    end
  end

  def user_panel
    render :partial => "shared/user_panel"
  end

  def user_greeting
    "Welcome, #{user_handle || 'Guest'}!"
  end

  def logged_in?
    session.has_key?("warden.user.default.key")
  end

  private
    def user_handle
      session[:user_handle]
    end
end
