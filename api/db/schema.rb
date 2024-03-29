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

ActiveRecord::Schema.define(version: 2019_04_20_145308) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "subdomain"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shifts", force: :cascade do |t|
    t.integer "team_id"
    t.date "date"
    t.string "start_time"
    t.string "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "manager_id"
    t.integer "employee_id"
    t.index ["client_id"], name: "index_shifts_on_client_id"
    t.index ["employee_id"], name: "index_shifts_on_employee_id"
    t.index ["manager_id"], name: "index_shifts_on_manager_id"
    t.index ["team_id"], name: "index_shifts_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "client_id"
    t.index ["client_id"], name: "index_teams_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "client_id"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_users_on_client_id"
  end

end
