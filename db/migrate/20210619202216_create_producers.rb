class CreateProducers < ActiveRecord::Migration[6.0]
  def change
    create_table :producers do |t|
      t.integer :user_id, null: false,unique: true
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
