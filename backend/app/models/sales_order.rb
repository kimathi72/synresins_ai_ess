class SalesOrder < ApplicationRecord
  belongs_to :customer
  has_many :sales_order_lines, dependent: :destroy
  validates :order_date, presence: true
end
