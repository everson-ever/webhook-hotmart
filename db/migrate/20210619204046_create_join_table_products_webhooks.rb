class CreateJoinTableProductsWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_join_table :products, :webhook_urls do |t|
      # t.index [:product_id, :webhook_url_id]
      # t.index [:webhook_url_id, :product_id]
    end
  end
end
