class AddInCartToPurchases < ActiveRecord::Migration[5.2]
  def change
    add_column :purchases, :incart?, :boolean, default: false
  end
end
