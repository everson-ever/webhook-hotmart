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

    def generate_webhook_response(purchase)
      data = {
        id: purchase.id,
        value: purchase.value,
        quantity: purchase.quantity,
        status: purchase.purchase_status.label,
        order_date: purchase.order_date,
        approved_date: purchase.approved_date,
        product: {
          product_id: purchase.product_id,
          name: purchase.product.name
        },
        client: {
          client_id: purchase.client_id,
          name: purchase.client.user.name,
          email: purchase.client.user.email
        },
        producer: {
          producer_id: purchase.product.producer.id,
          name: purchase.product.producer.user.name,
          email: purchase.product.producer.user.email
        }

      }

      data
    end

  end
end