class Customer < ApplicationRecord
  has_many :purchases
  has_many :inventories, through: :purchases
end
