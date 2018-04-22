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

ActiveRecord::Schema.define(version: 20180403103931) do

  create_table "bank_acnts", force: :cascade do |t|
    t.integer  "acntNo",     limit: 4
    t.string   "actype",     limit: 255
    t.string   "name",       limit: 255
    t.float    "balance",    limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "banktransactions", force: :cascade do |t|
    t.integer  "acntNo",     limit: 4
    t.string   "type",       limit: 255
    t.date     "onDate"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "donordetails", force: :cascade do |t|
    t.integer  "eventid",    limit: 4
    t.integer  "donorid",    limit: 4
    t.float    "amnt",       limit: 24
    t.integer  "acntNo",     limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "organizer",     limit: 4
    t.string   "eventName",     limit: 255
    t.string   "caption",       limit: 255
    t.string   "tags",          limit: 255
    t.string   "trustname",     limit: 255
    t.string   "location",      limit: 255
    t.float    "estAmnt",       limit: 24
    t.float    "collectedAmnt", limit: 24
    t.date     "endDate"
    t.integer  "acNo",          limit: 4
    t.integer  "ifscCode",          limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "moneydetails", force: :cascade do |t|
    t.integer  "organizerid", limit: 4
    t.integer  "eventid",     limit: 4
    t.string   "description", limit: 255
    t.float    "amount",      limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "userid",             limit: 4
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "teams", force: :cascade do |t|
    t.text     "role",       limit: 65535, null: false
    t.string   "name",       limit: 255
    t.string   "desig",      limit: 255
    t.string   "img",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "user_acnts", force: :cascade do |t|
    t.integer  "userNo",     limit: 4
    t.integer  "acNo",       limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "uname",      limit: 255
    t.string   "password",   limit: 255
    t.string   "phone",      limit: 255
    t.string   "mail",       limit: 255
    t.date     "dob"
    t.string   "gender",     limit: 255
    t.string   "address",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
