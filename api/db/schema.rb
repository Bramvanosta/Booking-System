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

ActiveRecord::Schema.define(version: 20170527000831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campground_id"
    t.string "token", null: false
    t.string "name", null: false
    t.boolean "can_view_bookings", default: true, null: false
    t.boolean "can_edit_bookings", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_api_keys_on_campground_id"
    t.index ["token"], name: "index_api_keys_on_token", unique: true
    t.index ["user_id"], name: "index_api_keys_on_user_id"
  end

  create_table "booking_has_people", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_has_people_on_booking_id"
    t.index ["person_id"], name: "index_booking_has_people_on_person_id"
  end

  create_table "booking_has_rentals", force: :cascade do |t|
    t.bigint "booking_id"
    t.bigint "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_has_rentals_on_booking_id"
    t.index ["rental_id"], name: "index_booking_has_rentals_on_rental_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "campground_id"
    t.bigint "client_id"
    t.string "status", default: "created"
    t.date "arrival_date", null: false
    t.date "departure_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_bookings_on_campground_id"
    t.index ["client_id"], name: "index_bookings_on_client_id"
  end

  create_table "campgrounds", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.float "longitude", null: false
    t.float "latitude", null: false
    t.string "logo_url"
    t.string "website_url"
    t.string "phone_number"
    t.string "mobile_number"
    t.string "currency", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "title", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.string "zip_code", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.string "phone_number", null: false
    t.string "mobile_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "booking_id"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "people", force: :cascade do |t|
    t.bigint "client_id"
    t.date "birth_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_people_on_client_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "season_id"
    t.bigint "rental_category_id"
    t.string "name", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "EUR", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_category_id"], name: "index_prices_on_rental_category_id"
    t.index ["season_id"], name: "index_prices_on_season_id"
  end

  create_table "rental_categories", force: :cascade do |t|
    t.bigint "campground_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_rental_categories_on_campground_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "rental_category_id"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_category_id"], name: "index_rentals_on_rental_category_id"
  end

  create_table "rights", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "campground_id"
    t.boolean "can_view_bookings", default: true, null: false
    t.boolean "can_edit_bookings", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "can_view_rights", default: true, null: false
    t.boolean "can_edit_rights", default: false, null: false
    t.boolean "can_view_campground", default: true, null: false
    t.boolean "can_edit_campground", default: false, null: false
    t.boolean "can_create_bookings", default: false, null: false
    t.boolean "can_delete_bookings", default: false, null: false
    t.boolean "can_view_clients", default: true, null: false
    t.boolean "can_edit_clients", default: false, null: false
    t.boolean "can_delete_clients", default: false, null: false
    t.boolean "can_view_api_keys", default: false, null: false
    t.boolean "can_create_api_keys", default: false, null: false
    t.boolean "can_edit_api_keys", default: false, null: false
    t.boolean "can_delete_api_keys", default: false, null: false
    t.boolean "can_view_users", default: false, null: false
    t.boolean "can_create_users", default: false, null: false
    t.boolean "can_edit_users", default: false, null: false
    t.boolean "can_delete_users", default: false, null: false
    t.index ["campground_id"], name: "index_rights_on_campground_id"
    t.index ["user_id"], name: "index_rights_on_user_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.bigint "campground_id"
    t.string "name", null: false
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campground_id"], name: "index_seasons_on_campground_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "api_keys", "campgrounds"
  add_foreign_key "api_keys", "users"
  add_foreign_key "booking_has_people", "bookings"
  add_foreign_key "booking_has_people", "people"
  add_foreign_key "booking_has_rentals", "bookings"
  add_foreign_key "booking_has_rentals", "rentals"
  add_foreign_key "bookings", "campgrounds"
  add_foreign_key "bookings", "clients"
  add_foreign_key "payments", "bookings"
  add_foreign_key "people", "clients"
  add_foreign_key "prices", "rental_categories"
  add_foreign_key "prices", "seasons"
  add_foreign_key "rental_categories", "campgrounds"
  add_foreign_key "rentals", "rental_categories"
  add_foreign_key "rights", "campgrounds"
  add_foreign_key "rights", "users"
  add_foreign_key "seasons", "campgrounds"
end
