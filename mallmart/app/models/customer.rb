class Customer < ApplicationRecord
  has_many :purchases
  has_many :inventories, through: :purchases

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def find_item
    find_hash = Hash.new
    self.purchases.select do |purchase_details|
      self.inventories.each do |inventory_details|
        if purchase_details.inventory_id == inventory_details.id
          find_hash[inventory_details.name] = purchase_details.purchased_quantity
        end
      end
    end
    find_hash
  end

end
