class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.decimal :amount

      t.timestamps
    end
  end
end
