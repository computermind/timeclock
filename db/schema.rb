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

ActiveRecord::Schema.define(version: 20180211234928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_initial"
    t.string "last_name"
    t.string "government_entity"
    t.string "position"
    t.string "employee_phone"
    t.integer "employee_id_number"
    t.string "supervisor_name"
    t.string "supervisor_phone"
    t.string "human_resource_manager"
    t.string "human_resource_phone"
    t.string "creator_name"
    t.boolean "status", default: true
    t.boolean "boolean", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "punches", force: :cascade do |t|
    t.text "comments"
    t.datetime "punch_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "employee_id"
    t.string "origin_ip"
    t.index ["employee_id"], name: "index_punches_on_employee_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employees", "users"
  add_foreign_key "punches", "employees"
end
