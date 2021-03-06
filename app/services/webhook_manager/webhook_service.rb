module WebhookManager
  class WebhookService
    def send_request(purchase_id)
      purchase = Purchase.find_by(id: purchase_id)

      webhook_service = WebhookService.new
      webhook_urls = get_webhook_url(purchase)

      webhook_urls.each do |webhook| 
        if !listening_purchase_status(webhook[:purchase_status_ids], purchase.purchase_status_id)
          next
        end

        webhook_response = generate_webhook_response(purchase)

        if webhook[:any]
          send_webhook(webhook[:url], webhook_response)
          next
        end

        if listening_this_product(purchase.product_id, webhook[:products_ids])
          send_webhook(webhook[:url], webhook_response)
        end
      end
    end

    private
      def get_webhook_url(purchase)
        product = Product.find_by_id(purchase.product_id)
        producer = Producer.find_by_id(product.producer_id)
        webhook_urls = producer.webhook_urls
        
        webhooks = []
        webhook_urls.each do |webhook|
          purchase_status = webhook.purchase_status
          products = webhook.products

          data = {
            url: webhook.url,
            any: webhook.any,
            purchase_status_ids: purchase_status.map { |status| status.id },
            products_ids: products.map { |product| product.id }
          }
          webhooks.push(data)
        end

        return webhooks
      end

      def send_webhook(url, data)
        uri = URI.parse(url)
        header = {'Content-Type': 'application/json'}
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri, header)
        request.body = data.to_json
    
        response = http.request(request)

        return response
      end

      def listening_purchase_status(listening_status, purchase_status_id)
        listening_status.include? purchase_status_id
      end

      def listening_this_product(product_id, products_id)
        products_id.include? product_id
      end

      def generate_webhook_response(purchase)
        client = purchase.client
        product = purchase.product
        producer = product.producer
        user_client = client.user
        user_producer = producer.user

        data = {
          id: purchase.id,
          value: purchase.value,
          quantity: purchase.quantity,
          status: purchase.purchase_status.label,
          order_date: purchase.order_date,
          approved_date: purchase.approved_date,
          product: {
            product_id: purchase.product_id,
            name: product.name
          },
          client: {
            client_id: purchase.client_id,
            name: user_client.name,
            email: user_client.email
          },
          producer: {
            producer_id: producer.id,
            name: user_producer.name,
            email: user_producer.email
          }

        }

        data
      end

  end
end