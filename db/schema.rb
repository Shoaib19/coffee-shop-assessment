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

ActiveRecord::Schema[7.0].define(version: 2024_09_01_075612) do
  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.integer "card_type", null: false
    t.text "card_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string "item_name", null: false
    t.integer "category", null: false
    t.boolean "availability", default: true, null: false
    t.integer "price", null: false
    t.text "description"
    t.integer "tax_amount", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "order_id"
    t.index ["customer_id"], name: "index_notifications_on_customer_id"
    t.index ["order_id"], name: "index_notifications_on_order_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity", default: 1, null: false
    t.decimal "discount", precision: 5, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "menu_item_id"
    t.integer "order_id"
    t.integer "return_id"
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["return_id"], name: "index_order_items_on_return_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", null: false
    t.integer "total_price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "payment_id"
    t.integer "customer_id"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["payment_id"], name: "index_orders_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id"
    t.integer "order_id"
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "returns", force: :cascade do |t|
    t.text "reason", null: false
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notifications", "customers"
  add_foreign_key "notifications", "orders"
  add_foreign_key "order_items", "menus", column: "menu_item_id"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "returns"
  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "payments"
  add_foreign_key "payments", "customers"
  add_foreign_key "payments", "orders"
end
