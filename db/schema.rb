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

ActiveRecord::Schema.define(version: 2021_06_23_234048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "tax_regime"
    t.string "phone"
    t.string "cnpj"
    t.float "icms"
    t.float "ipi"
    t.float "pis"
    t.float "cofins"
    t.float "payroll_percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.string "description"
    t.float "value"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_expenses_on_company_id"
  end

  create_table "job_functions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "manpowers", force: :cascade do |t|
    t.string "description"
    t.float "time_hex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_raw_materials", force: :cascade do |t|
    t.float "consumption"
    t.float "raw_material_cost"
    t.bigint "product_id", null: false
    t.bigint "raw_material_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_raw_materials_on_product_id"
    t.index ["raw_material_id"], name: "index_product_raw_materials_on_raw_material_id"
  end

  create_table "production_goals", force: :cascade do |t|
    t.integer "product_id"
    t.string "description"
    t.integer "monthly_goal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "description"
    t.string "unity"
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.float "icms"
    t.float "ipi"
    t.float "pis"
    t.float "cofins"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "net_price"
  end

  add_foreign_key "expenses", "companies"
  add_foreign_key "product_raw_materials", "products"
  add_foreign_key "product_raw_materials", "raw_materials"
  add_foreign_key "products", "companies"
end
