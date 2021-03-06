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

ActiveRecord::Schema.define(version: 20150727163539) do

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "class_number"
    t.text     "description"
    t.integer  "user_id"
    t.string   "title"
    t.string   "professor"
    t.string   "grade"
    t.string   "price"
    t.string   "preferred_time"
    t.string   "preferred_people"
    t.integer  "profile_id"
    t.boolean  "looking_for"
    t.integer  "department_id"
  end

  add_index "courses", ["department_id"], name: "index_courses_on_department_id"
  add_index "courses", ["profile_id"], name: "index_courses_on_profile_id"
  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "biography"
    t.string   "school"
    t.string   "year"
    t.string   "major"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "profile_id"
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "body"
  end

  add_index "reviews", ["profile_id"], name: "index_reviews_on_profile_id"

  create_table "schools", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "welcomes", force: :cascade do |t|
    t.string   "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
