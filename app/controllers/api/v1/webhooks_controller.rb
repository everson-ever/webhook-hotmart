class Api::V1::WebhooksController < ApiController

  def index
    begin
      webhooks = current_user.producer.webhook_urls

      return render json: webhooks
    rescue => e
      return render json: { status: false, message: e.message }
    end
  end

  def store
    begin
      data = {
        url: webhook_params[:url],
        any: webhook_params[:any],
        purchase_status_ids: webhook_params[:purchase_status_ids],
        producer_id: current_user.producer.id
      }

      webhook = WebhookUrl.new(data)
      webhook.save

      return render json: webhook
    rescue => e
      return render json: { status: false, message: e.message }
    end
  end

  def update
    begin
      webhook = WebhookUrl.find_by_id(params[:id])
      webhook.update(webhook_params)

      return render json: webhook
    rescue => e
      return render json: { status: false, message: e.message }
    end
  end

  private 
    def webhook_params
      params.permit(:url, :any, purchase_status_ids: [])
    end
end
