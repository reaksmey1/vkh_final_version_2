# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160503021757) do

  create_table "alerts", force: true do |t|
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_histories", force: true do |t|
    t.integer  "car_id"
    t.string   "problem"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "entry_date"
    t.string   "kilo_metre"
    t.string   "invoice_number"
  end

  create_table "car_history_spare_parts", force: true do |t|
    t.integer  "car_history_id"
    t.integer  "spare_part_id"
    t.integer  "amount"
    t.float    "unit_price"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_repairing_quote_statuses", force: true do |t|
    t.integer  "car_id"
    t.integer  "car_repairing_quote_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_repairing_quotes", force: true do |t|
    t.string   "name"
    t.string   "problem_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "car_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.string   "plate_number"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type"
    t.datetime "entry_date"
    t.string   "detail"
    t.string   "color"
    t.string   "phone_number"
    t.string   "conteur"
    t.string   "customer_name"
    t.string   "invoice_number"
  end

  create_table "sell_reports", force: true do |t|
    t.integer  "car_id"
    t.integer  "spare_part_id"
    t.float    "unit"
    t.float    "selling_price"
    t.float    "total_price"
    t.float    "recieved"
    t.float    "sub_total"
    t.float    "return"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_history_id"
    t.float    "discount"
    t.float    "total_discount"
    t.float    "vat"
  end

  create_table "spare_part_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spare_parts", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "amount_in_stock"
    t.float    "based_price"
    t.float    "selling_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spare_part_type_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
