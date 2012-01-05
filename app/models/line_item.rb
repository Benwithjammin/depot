class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :cart

  def total_price

    return product.price * quantity

  end

end
