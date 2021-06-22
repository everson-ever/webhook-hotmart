class CreateBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :balances do |t|
      t.decimal :value
      t.integer :user_id

      t.timestamps
    end
  end
end
