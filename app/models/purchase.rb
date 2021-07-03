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

  private
    def request_webhook_sender
      SendWebhookNotificationWorker.perform_async(self.id)
    end
end
