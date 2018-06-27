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

ActiveRecord::Schema.define(version: 2018_06_27_112944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_employees_on_organization_id"
    t.index ["user_id", "organization_id"], name: "index_employees_on_user_id_and_organization_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.bigint "psrn", null: false
    t.string "name", limit: 25, null: false
    t.integer "category", default: 0
    t.string "email", null: false
    t.string "phone", null: false
    t.text "biography"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["psrn"], name: "index_organizations_on_psrn", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title", null: false
    t.text "biography"
    t.string "image"
    t.float "price", null: false
    t.integer "signature_price", default: 0, null: false
    t.integer "qty", default: 1, null: false
    t.integer "signature_qty", default: 1, null: false
    t.string "ticketable_type"
    t.bigint "ticketable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticketable_type", "ticketable_id"], name: "index_tickets_on_ticketable_type_and_ticketable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "phone", null: false
    t.string "first_name", limit: 25
    t.string "last_name", limit: 25
    t.date "birthday"
    t.text "biography"
    t.text "itn"
    t.text "inoial"
    t.string "image"
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

end
