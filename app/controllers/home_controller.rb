class HomeController < ApplicationController

  before_filter :authenticate_with_warden, :only => [ :index ]

  def index
  end

end
