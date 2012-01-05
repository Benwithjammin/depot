class Cart < ActiveRecord::Base

  has_many :line_items, :dependent => :destroy

  def total_price

    return line_items.to_a.sum { | item | item.total_price }

  end

  def add_product(product_id)

    # From the book - This code uses a clever little Active Record trick. You see that the first line
    #                  of the method calls find_by_product_id. But we don’t define a method with that
    #                  name. However, Active Record notices the call to an undefined method and
    #                  spots that it starts with the string find_by and ends with the name of a column.
    #                  It then dynamically constructs a finder method for us, adding it to our class.

    current_item = line_items.find_by_product_id(product_id)

    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:product_id => product_id)
    end

    return current_item

  end


end
