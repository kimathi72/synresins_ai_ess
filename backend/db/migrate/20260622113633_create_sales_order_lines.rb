class CreateSalesOrderLines < ActiveRecord::Migration[8.1]
  def change
    create_table :sales_order_lines do |t|
      t.references :sales_order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.float :quantity
      t.float :unit_price
      t.float :line_total

      t.timestamps
    end
  end
end
