class CreateStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_status do |t|
      t.string :label
      t.string :description

      t.timestamps
    end
  end
end
