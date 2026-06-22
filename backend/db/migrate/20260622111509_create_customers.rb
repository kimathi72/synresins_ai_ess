class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :customer_type
      t.string :industry
      t.string :email
      t.string :phone
      t.string :city
      t.string :country
      t.boolean :active

      t.timestamps
    end
  end
end
