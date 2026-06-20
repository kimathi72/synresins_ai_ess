# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      include ActionController::MimeResponds
      

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { status: 404, message: e.message }, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {
          status: 422,
          message: e.record.errors.full_messages.to_sentence
        }, status: :unprocessable_entity
      end

      private

      def require_admin!
        return if current_api_v1_user&.admin?

        render json: { status: 403, message: "Admin only" }, status: :forbidden
      end

      def require_sales_or_admin!
        return if current_api_v1_user&.admin? || current_api_v1_user&.sales_rep?

        render json: { status: 403, message: "Sales/Admin only" }, status: :forbidden
      end
    end
  end
end