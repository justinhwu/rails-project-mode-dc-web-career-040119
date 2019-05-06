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
Supplier.destroy_all

nike = Supplier.create(name: "Nike", description: "We sell stuff.")
socks = Inventory.create(name: "Socks", quantity: 10, category: "Accessories", description: "They're socks.", price: 15 , supplier_id: 1)
track_pants = Inventory.create(name: "Trackpants", quantity: 50, category: "Coolest Pants", description: "Really, the coolest pants.", price: 20, supplier_id: 1)
bob = Customer.find_or_create_by(first_name: "Bob", last_name: "Johnson", email: "bobjohnson1@gmaill.com", phone_number: 1234567890, address: "123 Hello World")
first_purchase = Purchase.create(inventory_id: 1, customer_id: 1, purchased_quantity: 4)
second_purchase = Purchase.create(inventory_id: 2, customer_id: 1, purchased_quantity: 20)
