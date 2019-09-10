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

ActiveRecord::Schema.define(version: 20190910202723) do

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.string   "genre"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "band_members", force: :cascade do |t|
    t.string  "name"
    t.integer "artist_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "venue_id"
    t.string  "date"
  end

  create_table "dollars", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dollar_amount"
  end

  create_table "genres", force: :cascade do |t|
    t.string  "name"
    t.integer "venue_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venue_names", force: :cascade do |t|
    t.string "names"
  end

  create_table "venues", force: :cascade do |t|
    t.string  "name"
    t.integer "user_id"
  end

end
