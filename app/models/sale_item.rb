class SaleItem < ApplicationRecord
  belongs_to :item, inverse_of: :sale_items
  belongs_to :sale, inverse_of: :sale_items
end
