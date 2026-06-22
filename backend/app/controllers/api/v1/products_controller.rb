class Api::V1::ProductsController < BaseController
    before_action :authenticate_user! 
    before_action :find_product, only: [:show, :update, :destroy]
    def index
        products = Product.all
        render json: products, each_serializer: ProductSerializer
    end

    def show
        render json: product, serializer: ProductSerializer
    end

    def create
        product = Product.new(product_params)
        render json: product, serializer: ProductSerializer, status: :created
    end
    def update
        render json: product, serializer: ProductSerializer, if product.update(product_params)
    end
    def destroy
        product.destroy
        head :no_content 
    end
    private
    def find_product
        @product = Product.find(params[:id])
    end
    def product_params
        params.require(:product).permit(:sku, :name, :hs_class_id, :unit_of_measure, :standard_price, :active)
    end
end
