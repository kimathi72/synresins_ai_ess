class CreateSalesOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :sales_orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.date :order_date
      t.string :status
      t.float :total_amount

      t.timestamps
    end
  end
end
