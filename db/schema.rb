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

ActiveRecord::Schema.define(version: 20141029224620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "name",            null: false
    t.string   "zip",             null: false
    t.string   "phone_number"
    t.string   "website_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address",         null: false
    t.integer  "city_id",         null: false
  end

  add_index "businesses", ["address"], name: "index_businesses_on_address", using: :btree
  add_index "businesses", ["city_id"], name: "index_businesses_on_city_id", unique: true, using: :btree
  add_index "businesses", ["name"], name: "index_businesses_on_name", using: :btree

  create_table "cities", force: true do |t|
    t.string   "city_name",  null: false
    t.string   "country",    null: false
    t.string   "state",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.text     "content",     null: false
    t.integer  "rating",      null: false
    t.integer  "user_id",     null: false
    t.integer  "business_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["user_id", "business_id"], name: "index_reviews_on_user_id_and_business_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",        null: false
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
