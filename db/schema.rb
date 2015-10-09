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

ActiveRecord::Schema.define(version: 20151009040531) do

  create_table "comments", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.boolean  "is_private"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["event_id"], name: "index_comments_on_event_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.string   "public_location"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "max_size"
    t.integer  "user_id"
    t.datetime "time_start"
    t.datetime "time_end"
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.boolean  "status"
    t.boolean  "approval_required"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "host_id"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "ratings", force: :cascade do |t|
    t.integer  "event_id"
    t.float    "rating"
    t.text     "rating_feedback"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "rater_id"
    t.integer  "ratee_id"
  end

  add_index "ratings", ["event_id"], name: "index_ratings_on_event_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "rsvps", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.boolean  "pending"
    t.boolean  "confirmed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "guest_id"
  end

  add_index "rsvps", ["event_id"], name: "index_rsvps_on_event_id"
  add_index "rsvps", ["user_id"], name: "index_rsvps_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "password"
    t.string   "photo"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
