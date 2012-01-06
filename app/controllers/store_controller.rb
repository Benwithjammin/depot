class StoreController < ApplicationController

  def index

    @products = Product.all
    increment_counter()
    @counter = get_counter

    @cart = current_cart

  end

  private

    def increment_counter

      if session[:counter].nil?
        session[:counter] = 0
      end

      session[:counter] += 1

    end

    def get_counter
      return session[:counter]
    end

end
