# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_22_113633) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "customers", force: :cascade do |t|
    t.boolean "active"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "customer_type"
    t.string "email"
    t.string "industry"
    t.string "name"
    t.string "phone"
    t.datetime "updated_at", null: false
  end

  create_table "hs_classes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.bigint "hs_class_id", null: false
    t.string "name"
    t.string "sku"
    t.float "standard_price"
    t.string "unit_of_measure"
    t.datetime "updated_at", null: false
    t.index ["hs_class_id"], name: "index_products_on_hs_class_id"
  end

  create_table "sales_order_lines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.float "line_total"
    t.bigint "product_id", null: false
    t.float "quantity"
    t.bigint "sales_order_id", null: false
    t.float "unit_price"
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_sales_order_lines_on_product_id"
    t.index ["sales_order_id"], name: "index_sales_order_lines_on_sales_order_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.date "order_date"
    t.string "status"
    t.float "total_amount"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sales_orders_on_customer_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "jti", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "hs_classes"
  add_foreign_key "sales_order_lines", "products"
  add_foreign_key "sales_order_lines", "sales_orders"
  add_foreign_key "sales_orders", "customers"
end
