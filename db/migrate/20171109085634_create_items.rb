class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :partno
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
