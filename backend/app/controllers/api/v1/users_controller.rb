module Api
  module V1
    class UsersController < BaseController
      before_action :authenticate_api_v1_user!
      def me
        render json: {
          status: 200,
          user: UserSerializer.new(current_api_v1_user)
          
        }, status: :ok
      end
    end
  end
end