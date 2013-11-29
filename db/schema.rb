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

ActiveRecord::Schema.define(version: 20131124115009) do

  create_table "employees", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "annual_salary"
    t.decimal  "super_rate",    precision: 4, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["id"], name: "index_employees_on_id"

  create_table "tax_ranges", force: true do |t|
    t.integer  "income_min"
    t.integer  "income_max"
    t.decimal  "rate"
    t.integer  "tax_from_lower_range"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tax_ranges", ["income_min", "income_max"], name: "index_tax_ranges_on_income_min_and_income_max"

end
