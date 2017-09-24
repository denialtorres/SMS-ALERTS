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

ActiveRecord::Schema.define(version: 20170924012637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string   "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "volunters"
    t.string   "zone"
    t.string   "state"
    t.index ["category_id"], name: "index_alerts_on_category_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.integer  "value"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.bigint   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.string   "about_yo"
    t.string   "estate"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["phone"], name: "index_contacts_on_phone", unique: true, using: :btree
  end

end
