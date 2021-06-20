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
        if !webhook_service.listening_purchase_status(webhook[:status], self.purchase_status_id)
          next
        end

        if webhook[:any]
          response = webhook_service.send_webhook(webhook[:url], self)
        end
      end

      return true
    rescue => exception
        return false
    end
  end

end
