class Api::V1::SalesOrdersController < BaseController
    before_action :authenticate_user! 
    before_action :find_sales_order, only: [:show, :update, :destroy]
    def index
        sales_orders = SalesOrder.all
        render json: sales_orders, each_serializer: SalesOrderSerializer
    end

    def show
        render json: sales_order, serializer: SalesOrderSerializer
    end

    def create
        sales_order = SalesOrder.new(sales_order_params)
        render json: sales_order, serializer: SalesOrderSerializer, status: :created
    end
    def update
        render json: sales_order, serializer: SalesOrderSerializer, if sales_order.update(sales_order_params)
    end
    def destroy
        sales_order.destroy
        head :no_content 
    end
    private
    def find_sales_order
        @sales_order = SalesOrder.find(params[:id])
    end
    def sales_order_params
        params.require(:sales_order).permit(:customer_id, :order_date, :status, :total_amount)
    end
end
