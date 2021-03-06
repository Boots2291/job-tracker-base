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

ActiveRecord::Schema.define(version: 20170919151434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "level_of_interest"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "company_id"
    t.string   "city"
    t.integer  "salary"
    t.index ["company_id"], name: "index_jobs_on_company_id", using: :btree
  end

  create_table "jobs_tags", force: :cascade do |t|
    t.integer "job_id"
    t.integer "tag_id"
    t.index ["job_id"], name: "index_jobs_tags_on_job_id", using: :btree
    t.index ["tag_id"], name: "index_jobs_tags_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs_tags", "jobs"
  add_foreign_key "jobs_tags", "tags"
end
