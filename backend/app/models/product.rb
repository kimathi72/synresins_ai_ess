class Product < ApplicationRecord
  belongs_to :hs_class
  has_many :sales_order_lines 

  validates :name, presence: true
  validates :sku, presence: true, uniqueness: true
end
