include WebhookManager

class SendWebhookNotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(purchase_id)
    WebhookService.new.send_request(purchase_id)
  end
end