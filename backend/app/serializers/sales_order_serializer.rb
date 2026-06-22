class SalesOrderSerializer < ActiveModel::Serializer
  attributes :id, :customer_id, :order_date, :status, :total_amount, :created_at, :updated_at
end
