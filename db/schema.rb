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

ActiveRecord::Schema[7.0].define(version: 2022_05_14_213501) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixed_expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "value", precision: 4, scale: 2
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_fixed_expenses_on_studio_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 4, scale: 2
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_products_on_studio_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "cnpj"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.string "cpf"
    t.string "email"
    t.string "photo_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "variable_expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "value", precision: 4, scale: 2
    t.bigint "studio_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_variable_expenses_on_studio_id"
  end

  create_table "variable_product_expenses", force: :cascade do |t|
    t.string "name"
    t.decimal "value", precision: 4, scale: 2
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_variable_product_expenses_on_product_id"
  end

  create_table "work_hours", force: :cascade do |t|
    t.decimal "compensation", precision: 8, scale: 2
    t.integer "working_hours_per_day"
    t.integer "working_days_per_week"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "hourly_rate", precision: 4, scale: 2
    t.index ["user_id"], name: "index_work_hours_on_user_id"
  end

  add_foreign_key "fixed_expenses", "studios"
  add_foreign_key "products", "studios"
  add_foreign_key "studios", "users"
  add_foreign_key "variable_expenses", "studios"
  add_foreign_key "variable_product_expenses", "products"
  add_foreign_key "work_hours", "users"
end
