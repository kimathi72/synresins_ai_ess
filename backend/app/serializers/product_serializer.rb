class ProductSerializer < ActiveModel::Serializer
  attributes :id, :sku, :name, :hs_class_id, :unit_of_measure, :standard_price, :active, :created_at, :updated_at
end
