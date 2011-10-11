class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_globals

  def set_globals
    @date_time = Time.now.ctime;
  end

end
