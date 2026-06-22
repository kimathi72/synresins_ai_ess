class Api::V1::CustomersController < BaseController
    before_action :authenticate_user! 
    before_action :find_customer, only: [:show, :update, :destroy]
    def index
        customers = Customer.all
        render json: customers, each_serializer: CustomerSerializer
    end

    def show
        render json: customer, serializer: CustomerSerializer
    end

    def create
        customer = Customer.new(customer_params)
        render json: customer, serializer: CustomerSerializer, status: :created
    end
    def update
        render json: customer, serializer: CustomerSerializer, if customer.update(customer_params)
    end
    def destroy
        customer.destroy
        head :no_content 
    end
    private
    def find_customer
        @customer = Customer.find(params[:id])
    end
    def customer_params
        params.require(:customer).permit(:name, :customer_type, :industry, :email, :phone, :city, :country, :active)
    end
end
