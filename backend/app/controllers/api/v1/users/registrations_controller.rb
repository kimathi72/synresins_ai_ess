module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        respond_to :json

        private

        def sign_up_params
          params.require(:user).permit(
            :name,
            :role,
            :email,
            :password,
            :password_confirmation
          )
        end

        def respond_with(resource, _opts = {})
          return render_registration_errors(resource) unless resource.persisted?

          token = request.env["warden-jwt_auth.token"]

          render json: {
            status: {
              code: 201,
              message: "Signed up successfully."
            },
            token: token,
            user: UserSerializer.new(resource) || {}
          }, status: :created
        end

        

        def render_registration_errors(resource)
          Rails.logger.error(
            "Registration failed: #{resource.errors.full_messages}"
          )

          render json: {
            status: {
              code: 422,
              message: "User couldn't be created successfully."
            },
            errors: resource.errors.to_hash(true)
          }, status: :unprocessable_entity
        end
      end
    end
  end
end