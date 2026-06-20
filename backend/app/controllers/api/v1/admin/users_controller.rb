# app/controllers/api/v1/admin/users_controller.rb

module Api
  module V1
    module Admin
      class UsersController < BaseController
        before_action :require_admin!

        def create
          user = User.new(user_params)

          if user.save
            render json: {
              message: "User created successfully",
              user: UserSerializer.new(user)
            }, status: :created
          else
            render json: {
              errors: user.errors.full_messages
            }, status: :unprocessable_entity
          end
        end

        private

        def user_params
          params.require(:user).permit(
            :email,
            :password,
            :password_confirmation,
            :role
          )
        end
      end
    end
  end
end