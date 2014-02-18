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

ActiveRecord::Schema.define(version: 20140218063448) do

  create_table "agreements", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consideration_items", force: true do |t|
    t.integer  "pet_id"
    t.integer  "consideration_list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consideration_items", ["consideration_list_id"], name: "index_consideration_items_on_consideration_list_id"
  add_index "consideration_items", ["pet_id"], name: "index_consideration_items_on_pet_id"

  create_table "consideration_lists", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "pet_id"
    t.integer  "agreement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["agreement_id"], name: "index_line_items_on_agreement_id"
  add_index "line_items", ["pet_id"], name: "index_line_items_on_pet_id"

  create_table "pet_selectors", force: true do |t|
    t.integer  "pet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pet_selectors", ["pet_id"], name: "index_pet_selectors_on_pet_id"

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "species"
    t.string   "image_url"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
