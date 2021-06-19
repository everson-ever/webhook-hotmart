class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :product_id
      t.integer :client_id
      t.integer :purchase_status_id
      t.datetime :order_date
      t.datetime :approved_date
      t.decimal :value
      t.integer :quantity

      t.timestamps
    end
  end
end
