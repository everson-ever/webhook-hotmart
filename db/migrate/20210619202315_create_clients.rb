class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.integer :user_id, null: false, unique: true
      t.string  :phone
      t.integer :age

      t.timestamps
    end
  end
end
