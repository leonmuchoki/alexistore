class CreateSaleItems < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_items do |t|
      t.decimal :price
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
