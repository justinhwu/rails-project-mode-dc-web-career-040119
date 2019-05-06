class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :inventory_id
      t.integer :customer_id
      t.integer :purchased_quantity

      t.timestamps
    end
  end
end
