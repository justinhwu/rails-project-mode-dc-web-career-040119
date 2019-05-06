# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Inventory.destroy_all
Customer.destroy_all
Purchase.destroy_all


socks = Inventory.create(name: "Socks", quantity: 10, category: "Accessories", description: "They're socks.", price: 15)
bob = Customer.find_or_create_by(first_name: "Bob", last_name: "Johnson", email: "bobjohnson1@gmaill.com", phone_number: 1234567890, address: "123 Hello World")
first_purchase = Purchase.create(inventory_id: 1, customer_id: 1, purchased_quantity: 4)
