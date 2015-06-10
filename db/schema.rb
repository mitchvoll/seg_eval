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

ActiveRecord::Schema.define(version: 20150610162733) do

  create_table "algorithms", force: :cascade do |t|
    t.string   "name"
    t.text     "code"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.string   "filetype"
    t.string   "filename"
  end

  add_index "algorithms", ["user_id"], name: "index_algorithms_on_user_id"

  create_table "datasets", force: :cascade do |t|
    t.string   "name"
    t.string   "filename"
    t.string   "thumbnail"
    t.string   "description"
    t.integer  "height"
    t.integer  "width"
    t.integer  "frames"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "download_num"
  end

  add_index "datasets", ["user_id"], name: "index_datasets_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
