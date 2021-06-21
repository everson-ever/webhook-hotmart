module WebhookManager
  class WebhookService

    def get_webhook_url(purchase)
      product = Product.find_by_id(purchase.product_id)
      producer = Producer.find_by_id(product.producer_id)
      webhook_urls = producer.webhook_urls
      
      webhooks = []
      webhook_urls.each do |webhook|
        purchase_status = webhook.purchase_status
        data = {
          url: webhook.url,
          any: webhook.any,
          status: purchase_status.map { |status| status.id }
        }
        webhooks.push(data)
      end

      return webhooks
    end

    def send_webhook(url, data)
      uri = URI.parse(url)
      header = {'Content-Type': 'application/json'}
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = data.to_json
  
      response = http.request(request)

      return response
    end

    def listening_purchase_status(listening_status, purchase_status_id)
      listening_status.include? purchase_status_id
    end

  end
end