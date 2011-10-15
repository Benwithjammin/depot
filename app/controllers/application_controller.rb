class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :set_controller_globals

  def set_controller_globals
    @date_time = Time.now.ctime
  end

  private

    def current_cart
        Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end

end
