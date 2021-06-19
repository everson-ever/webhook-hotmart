class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :producer_id, null: false
      t.string  :name,        null: false
      t.decimal :value,       null: false

      t.timestamps
    end
  end
end
