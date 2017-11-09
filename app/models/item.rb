class Item < ApplicationRecord
  has_many :sale_items, inverse_of: :item
  has_many :sales, through: :sale_items
end
