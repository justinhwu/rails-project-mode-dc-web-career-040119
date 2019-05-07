class AddUsernameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :username, :string
  end
end
