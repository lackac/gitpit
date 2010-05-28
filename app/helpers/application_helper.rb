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
end
