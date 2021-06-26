require 'net/http'
require 'uri'
require 'json'

include WebhookManager

class Purchase < ApplicationRecord

  belongs_to :client
  belongs_to :product
  belongs_to :purchase_status

  after_create :request_webhook_sender

  validates :product_id, :client_id, :purchase_status_id, :order_date, :value, :quantity, presence: true

  def request_webhook_sender
    begin
      webhook_service = WebhookService.new
      webhook_urls = webhook_service.get_webhook_url(self)
      
      webhook_urls.each do |webhook| 
        if !webhook_service.listening_purchase_status(webhook[:purchase_status_ids], self.purchase_status_id)
          next
        end

        webhook_response = webhook_service.generate_webhook_response(self)

        if webhook[:any]
          webhook_service.send_webhook(webhook[:url], webhook_response)
          next
        end

        if webhook_service.listening_this_product(self.product_id, webhook[:products_ids])
          webhook_service.send_webhook(webhook[:url], webhook_response)
        end
      end

    rescue => e
      return false
    end
  end

end
