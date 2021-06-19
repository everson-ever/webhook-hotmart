class CreateJoinTableStatusWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :purchase_status, :webhook_urls do |t|
      # t.index [:purchase_status_id, :webhook_url_id]
      # t.index [:webhook_url_id, :purchase_status_id]
    end
  end
end
