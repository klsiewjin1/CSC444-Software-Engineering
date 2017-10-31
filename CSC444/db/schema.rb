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

ActiveRecord::Schema.define(version: 20171031142522) do

  create_table "reviews", force: :cascade do |t|
    t.integer "reviewer_id"
    t.integer "reviewee_id"
    t.text "review"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "service_id"
  end

  create_table "reviews_tables", force: :cascade do |t|
    t.integer "reviewerID"
    t.integer "revieweeID"
    t.text "review"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_listing_approvals", force: :cascade do |t|
    t.integer "service_listing_id"
    t.integer "teen_id"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_listings", force: :cascade do |t|
    t.date "task_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.integer "service_id"
    t.float "hourly_rate"
    t.string "description"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_type"
    t.string "username"
    t.string "fname"
    t.string "lname"
    t.string "state"
    t.string "address"
    t.string "pcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "cellphone"
    t.date "bdate"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
