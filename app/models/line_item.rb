class LineItem < ActiveRecord::Base

  belongs_to :product
  belongs_to :cart

  def total_price

    return product.price * quantity

  end

  def decrement_quantity

    self.quantity -= 1
    self.save

    if (self.quantity == 0)
      self.destroy
    end

  end

end
