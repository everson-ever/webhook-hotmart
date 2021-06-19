class CreateWebhookUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :webhook_urls do |t|
      t.integer :producer_id, null: false
      t.string :url,          null: false
      t.boolean :any,         null: false

      t.timestamps
    end
  end
end
