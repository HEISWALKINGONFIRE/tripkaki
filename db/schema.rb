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

ActiveRecord::Schema.define(version: 20161007081011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "packages", force: :cascade do |t|
<<<<<<< HEAD
    t.string   "title"
    t.string   "destination"
    t.string   "state"
    t.string   "country"
    t.integer  "day"
    t.text     "description"
=======
    t.string   "title",          null: false
    t.string   "destination"
    t.string   "state",          null: false
    t.string   "country",        null: false
    t.integer  "day",            null: false
    t.text     "description",    null: false
>>>>>>> 32022dfc697b04873f23bb73bd7959292cf73830
    t.string   "accommodation"
    t.string   "transportation"
    t.string   "meal"
    t.integer  "head"
    t.integer  "private_price"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "packages", ["country"], name: "index_packages_on_country", using: :btree
  add_index "packages", ["day"], name: "index_packages_on_day", using: :btree
  add_index "packages", ["state"], name: "index_packages_on_state", using: :btree
  add_index "packages", ["title"], name: "index_packages_on_title", using: :btree
  add_index "packages", ["user_id"], name: "index_packages_on_user_id", using: :btree

  create_table "private_reservations", force: :cascade do |t|
    t.integer  "package_id"
    t.integer  "user_id"
    t.integer  "head_count"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "private_reservations", ["package_id"], name: "index_private_reservations_on_package_id", using: :btree
  add_index "private_reservations", ["user_id"], name: "index_private_reservations_on_user_id", using: :btree

  create_table "public_reservations", force: :cascade do |t|
    t.integer  "package_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "public_price"
  end

  add_index "public_reservations", ["package_id"], name: "index_public_reservations_on_package_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.integer  "role"
    t.string   "profile_picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_public_reservations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "public_reservation_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "users_public_reservations", ["public_reservation_id"], name: "index_users_public_reservations_on_public_reservation_id", using: :btree
  add_index "users_public_reservations", ["user_id"], name: "index_users_public_reservations_on_user_id", using: :btree

  add_foreign_key "packages", "users"
end
