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

ActiveRecord::Schema.define(version: 2019_02_02_163227) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "arrival"
    t.date "departure"
    t.integer "trip_price"
    t.string "status"
    t.bigint "user_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "codes", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "hospital_id"
    t.index ["hospital_id"], name: "index_codes_on_hospital_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "zipcode"
    t.string "zipcode_district"
    t.integer "capacity"
    t.integer "number_of_rooms"
    t.integer "price_per_day"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false, null: false
    t.boolean "availability", default: false, null: false
    t.string "address"
    t.bigint "hospital_id"
    t.float "latitude"
    t.float "longitude"
    t.integer "bookings_count"
    t.string "photo"
    t.string "flat_type"
    t.index ["hospital_id"], name: "index_flats_on_hospital_id"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "hospital_flats", force: :cascade do |t|
    t.bigint "flat_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_hospital_flats_on_flat_id"
    t.index ["user_id"], name: "index_hospital_flats_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "hospital_name"
    t.string "zipcode"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.string "room"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_photos_on_flat_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.bigint "user_id"
    t.bigint "flat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_id"], name: "index_reviews_on_flat_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "family"
    t.string "first_name"
    t.string "family_member"
    t.boolean "hospital_admin", default: false, null: false
    t.boolean "super_admin", default: false, null: false
    t.bigint "hospital_id"
    t.boolean "super_host", default: false, null: false
    t.boolean "approved", default: false, null: false
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["hospital_id"], name: "index_users_on_hospital_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "users"
  add_foreign_key "codes", "hospitals"
  add_foreign_key "flats", "hospitals"
  add_foreign_key "flats", "users"
  add_foreign_key "hospital_flats", "flats"
  add_foreign_key "hospital_flats", "users"
  add_foreign_key "photos", "flats"
  add_foreign_key "reviews", "flats"
  add_foreign_key "reviews", "users"
  add_foreign_key "users", "hospitals"
end
