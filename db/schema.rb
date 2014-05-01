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

ActiveRecord::Schema.define(version: 20140401061916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: true do |t|
    t.string   "name",       null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", using: :btree

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programs", ["name"], name: "index_programs_on_name", unique: true, using: :btree
  add_index "programs", ["url"], name: "index_programs_on_url", unique: true, using: :btree

  create_table "show_track_relations", force: true do |t|
    t.integer  "show_id"
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "show_track_relations", ["show_id", "track_id"], name: "index_show_track_relations_on_show_and_track_ids", unique: true, using: :btree

  create_table "shows", force: true do |t|
    t.date     "date"
    t.integer  "remote_id",  null: false
    t.integer  "program_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shows", ["date"], name: "index_shows_on_date", using: :btree
  add_index "shows", ["remote_id", "program_id"], name: "index_shows_on_remote_id_and_program_id", unique: true, using: :btree

  create_table "tracks", force: true do |t|
    t.string   "title",      null: false
    t.integer  "artist_id"
    t.string   "album_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["title", "artist_id"], name: "index_shows_on_title_and_artist_id", unique: true, using: :btree

end
