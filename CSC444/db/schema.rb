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

ActiveRecord::Schema.define(version: 20171024150903) do

  create_table "clients", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "bdate"
    t.string "state"
    t.string "strnum"
    t.string "pcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "cellphone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "reviewerID"
    t.integer "revieweeID"
    t.text "review"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_listings", force: :cascade do |t|
    t.integer "clientID"
    t.integer "serviceID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teens", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "state"
    t.string "streetnum"
    t.string "pcode"
    t.string "city"
    t.string "country"
    t.string "email"
    t.string "cellphone"
    t.string "bdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "usertype"
    t.string "username"
    t.string "fname"
    t.string "lname"
    t.string "state"
    t.string "streetnum"
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
