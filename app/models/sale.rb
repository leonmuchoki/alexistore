class Sale < ApplicationRecord
  has_many :sale_items, inverse_of: :sale
  has_many :items, through: :sale_items

   accepts_nested_attributes_for :sale_items
end
