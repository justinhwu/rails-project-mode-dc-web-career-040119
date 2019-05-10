require 'faker'
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
adidas = Supplier.create(name: "Adidas", description: "We sell Addidas stuff.")
lays = Supplier.create(name: "Lays", description: "We sell snacks!")


socks = Inventory.create!(name: "Socks", quantity: 10, category: "Accessories", description: "They're socks.", price: 15 , supplier_id: nike.id)
track_pants = Inventory.create(name: "Trackpants", quantity: 50, category: "Coolest Pants", description: "Really, the coolest pants.", price: 20, supplier_id: nike.id)
hyperspace_yeezys = Inventory.create(name: "Yeezy Boost 350 V2 Hyperspace", quantity: 12, category: "Shoe", description: "HYPE", price: 220, supplier_id: adidas.id)
triple_white_ultraboosts = Inventory.create(name: "Triple White UltraBoosts", quantity: 25, category: "Shoe", description: "SQUAAAAAAA", price: 180, supplier_id: adidas.id)
fritos = Inventory.create(name: "Fritos", quantity: 9000, category: "Snack", description: "The best snack", price: 1, supplier_id: lays.id)

#Data for Customer
Customer.create([{first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name ,
                    email:Faker::Internet.email ,
                    phone_number: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.street_address, username: Faker::Name.initials, password: '1234567890'
                    }])
Customer.create([{first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name ,
                    email:Faker::Internet.email ,
                    phone_number: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.street_address, username: Faker::Name.initials, password: '234123909123'
                    }])
Customer.create([{first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name ,
                    email:Faker::Internet.email ,
                    phone_number: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.street_address, username: Faker::Name.initials, password: '345123123213'
                    }])
Customer.create([{first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name ,
                    email:Faker::Internet.email ,
                    phone_number: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.street_address, username: Faker::Name.initials, password: '45612312312'
                    }])
Customer.create([{first_name: Faker::Name.first_name,
                    last_name: Faker::Name.last_name ,
                    email:Faker::Internet.email ,
                    phone_number: Faker::PhoneNumber.cell_phone,
                    address: Faker::Address.street_address, username: Faker::Name.initials, password: '56123123217'
                    }])


first_purchase = Purchase.create(inventory_id: 1, customer_id: 1, purchased_quantity: 4, incart?: true)
second_purchase = Purchase.create(inventory_id: 2, customer_id: 1, purchased_quantity: 20, incart?: true)
