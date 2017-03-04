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

ActiveRecord::Schema.define(version: 20170115230419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histograms", force: :cascade do |t|
    t.integer  "week_day",        null: false
    t.integer  "month",           null: false
    t.integer  "day_of_month",    null: false
    t.integer  "year",            null: false
    t.integer  "hour",            null: false
    t.integer  "minute",          null: false
    t.datetime "time",            null: false
    t.integer  "available_bikes"
    t.integer  "available_docks"
    t.integer  "station_id"
    t.index ["hour"], name: "index_histograms_on_hour", using: :btree
    t.index ["minute"], name: "index_histograms_on_minute", using: :btree
    t.index ["month"], name: "index_histograms_on_month", using: :btree
    t.index ["station_id"], name: "index_histograms_on_station_id", using: :btree
    t.index ["time"], name: "index_histograms_on_time", using: :btree
    t.index ["week_day"], name: "index_histograms_on_week_day", using: :btree
    t.index ["year"], name: "index_histograms_on_year", using: :btree
  end

  create_table "stations", force: :cascade do |t|
    t.string   "station_name",                    null: false
    t.integer  "available_docks", default: 0
    t.integer  "available_bikes", default: 0
    t.integer  "total_docks",     default: 0
    t.float    "latitude",                        null: false
    t.float    "longitude",                       null: false
    t.string   "status_value"
    t.string   "status_key",      default: "-1"
    t.string   "st_address_one"
    t.string   "st_address_two"
    t.string   "city"
    t.string   "postal_code"
    t.string   "location"
    t.string   "altitude"
    t.boolean  "test_station",    default: false
    t.datetime "last_update"
    t.string   "landmark"
    t.integer  "heading",         default: 0
  end

  create_table "stations_users", id: false, force: :cascade do |t|
    t.integer "user_id",    null: false
    t.integer "station_id", null: false
    t.index ["station_id", "user_id"], name: "index_stations_users_on_station_id_and_user_id", using: :btree
    t.index ["user_id", "station_id"], name: "index_stations_users_on_user_id_and_station_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.string   "image"
    t.string   "email"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

end
