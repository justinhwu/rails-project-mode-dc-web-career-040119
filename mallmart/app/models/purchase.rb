class Purchase < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory

  def get_item_price
    total_price = self.inventory.price * self.purchased_quantity
    return total_price
  end
end
