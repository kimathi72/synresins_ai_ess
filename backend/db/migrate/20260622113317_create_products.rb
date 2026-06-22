class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.references :hs_class, null: false, foreign_key: true
      t.string :unit_of_measure
      t.float :standard_price
      t.boolean :active

      t.timestamps
    end
  end
end
