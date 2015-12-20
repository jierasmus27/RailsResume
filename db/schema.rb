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

ActiveRecord::Schema.define(version: 20151122162007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "institution_id"
    t.integer  "instructor_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "courses", ["institution_id"], name: "index_courses_on_institution_id", using: :btree
  add_index "courses", ["instructor_id"], name: "index_courses_on_instructor_id", using: :btree
  add_index "courses", ["name"], name: "index_courses_on_name", using: :btree

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "institutions", ["institution_id"], name: "index_institutions_on_institution_id", using: :btree
  add_index "institutions", ["name"], name: "index_institutions_on_name", using: :btree

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "instructors", ["institution_id"], name: "index_instructors_on_institution_id", using: :btree
  add_index "instructors", ["name"], name: "index_instructors_on_name", using: :btree

  add_foreign_key "courses", "institutions"
  add_foreign_key "courses", "instructors"
  add_foreign_key "institutions", "institutions"
  add_foreign_key "instructors", "institutions"
end
