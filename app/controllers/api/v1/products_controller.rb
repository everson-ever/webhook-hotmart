class Api::V1::ProductsController < ApiController
  before_action :enabled_producer

  def index
    begin
      products = Product.all

      return render json: products
    rescue => e
      return render json: { status: false, message: 'Internal Server Error' }
    end
  end

  def show
    product = Product.find_by_id(params[:id])

    return render json: product
  end

  def store
    data = {
      name: product_params[:name],
      value: product_params[:value],
      producer_id: current_user.producer.id
    }

    product = Product.new(data)
    product.save

    return render json: product
  end

  private
    def product_params
      params.require(:product).permit(:name, :value)
    end

    def enabled_producer
      if !current_user.producer.active
        return render json: { status: false, message: "Enable producer feature, please"  }, status: 401
      end
    end

end
