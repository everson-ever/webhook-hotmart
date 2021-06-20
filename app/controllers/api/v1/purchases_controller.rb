class Api::V1::PurchasesController < ApiController


  def index
    begin
      purchases = current_user.client.purchases

      return render json: purchases
    rescue => e
      return render json: { status: false, message: e.message }
    end
  end

  def store
    begin
      product = Product.find_by_id(purchase_params[:product_id])
      raise "product not found" if product.blank?
      raise "this action is not possible! You can't buy this product" if product.producer_id == current_user.producer.id

      data = purchase_params.clone
      data[:value] = product.value
      data[:client_id] = current_user.client.id

      purchase = Purchase.new(data)
      purchase.save()

      return render json: purchase
    rescue => e
      return render json: { status: false, message: e.message }
    end
  end

  private
    def purchase_params
      params.require(:purchase).permit(:product_id, :purchase_status_id, :order_date, :approved_date, :quantity)
    end

end
