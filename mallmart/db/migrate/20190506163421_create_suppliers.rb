class CreateSuppliers < ActiveRecord::Migration[5.2]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.integer :inventory_id

      t.timestamps
    end
  end
end
