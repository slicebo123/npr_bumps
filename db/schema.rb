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

ActiveRecord::Schema.define(version: 20141107075450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "album_artist_relations", force: true do |t|
    t.integer  "album_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "album_artist_relations", ["album_id", "artist_id"], name: "index_album_artist_relations_on_album_and_artist_ids", unique: true, using: :btree

  create_table "albums", force: true do |t|
    t.string   "name"
    t.integer  "artist_id"
    t.string   "spotify_id"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: true do |t|
    t.string   "name",       null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", using: :btree

  create_table "episode_track_relations", force: true do |t|
    t.integer  "episode_id"
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episode_track_relations", ["episode_id", "track_id"], name: "index_episode_track_relations_on_episode_and_track_ids", unique: true, using: :btree

  create_table "episodes", force: true do |t|
    t.integer  "npr_id"
    t.datetime "date"
    t.string   "url"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "episodes", ["date"], name: "index_episodes_on_date", using: :btree
  add_index "episodes", ["npr_id", "program_id"], name: "index_episodes_on_npr_id_and_program_id", unique: true, using: :btree

  create_table "linked_accounts", force: true do |t|
    t.integer  "uid"
    t.integer  "person_id"
    t.string   "type"
    t.string   "email"
    t.string   "name"
    t.string   "image_url"
    t.string   "oauth_token"
    t.string   "refresh_token"
    t.string   "expires_at"
    t.integer  "expires_in"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlist_program_relations", force: true do |t|
    t.integer  "playlist_id"
    t.integer  "program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "playlists", force: true do |t|
    t.string   "name"
    t.string  "external_id"
    t.integer  "person_id"
    t.string  "external_owner_id"
    t.boolean  "public"
    t.boolean  "collaborative"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "slug"
    t.integer  "npr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "programs", ["name"], name: "index_programs_on_name", unique: true, using: :btree
  add_index "programs", ["url"], name: "index_programs_on_url", unique: true, using: :btree

  create_table "track_artist_relations", force: true do |t|
    t.integer  "track_id"
    t.integer  "artist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "track_artist_relations", ["track_id", "artist_id"], name: "index_track_artist_relations_on_track_and_artist_ids", unique: true, using: :btree

  create_table "tracks", force: true do |t|
    t.string   "title",          null: false
    t.integer  "artist_id"
    t.integer  "album_id"
    t.hstore   "npr_attributes"
    t.string   "external_ids"
    t.string   "spotify_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tracks", ["title", "album_id"], name: "index_shows_on_title_and_album_id", unique: true, using: :btree

  create_table "unsynced_songs", force: true do |t|
    t.string   "raw_html"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
