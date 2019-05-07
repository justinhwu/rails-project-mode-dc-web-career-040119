class Inventory < ApplicationRecord
  has_many :purchases
  has_many :customers, through: :purchases
  belongs_to :supplier
  accepts_nested_attributes_for :purchases
end
