class CombineItemsInCart < ActiveRecord::Migration
  def self.up
    Cart.find_each do |cart|
      # find number of the same products for one cart
      sums = cart.line_items.group(:product_id).sum(:quantity)
      # replace with single item in table
      sums.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(:product_id => product_id).delete_all
          cart.line_items.create(:product_id => product_id, :quantity => quantity)
        end
      end
    end
  end

  def self.down
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1" ).each do |line_item|
    # add individual items
      line_item.quantity.times do
      LineItem.create :cart_id    => line_item.cart_id,
                      :product_id => line_item.product_id,
                      :quantity   => 1
      end
      # remove original item
      line_item.destroy
    end
  end
end
