class CreateInventories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventories do |t|
      t.string :name
      t.integer :quantity
      t.string :category
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
