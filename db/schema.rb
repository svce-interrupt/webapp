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

ActiveRecord::Schema.define(version: 20170904160027) do

  create_table "events", force: :cascade do |t|
    t.boolean  "e1"
    t.boolean  "e2"
    t.boolean  "e3"
    t.boolean  "e4"
    t.boolean  "e5"
    t.boolean  "e6"
    t.boolean  "e7"
    t.boolean  "e8"
    t.boolean  "e9"
    t.integer  "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_events_on_users_id"
  end

  create_table "registers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "phone"
    t.string   "college_name"
    t.boolean  "e1"
    t.boolean  "e2"
    t.boolean  "e3"
    t.boolean  "e4"
    t.boolean  "e5"
    t.boolean  "e6"
    t.boolean  "e7"
    t.boolean  "e8"
    t.boolean  "e9"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["email"], name: "index_registers_on_email"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "name"
    t.string   "phone"
    t.string   "college"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
