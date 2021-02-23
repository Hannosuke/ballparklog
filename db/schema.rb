# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_23_072647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "ballpark_logs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "stadium_id"
    t.bigint "team_id"
    t.bigint "game_id"
    t.string "result"
    t.index ["game_id"], name: "index_ballpark_logs_on_game_id"
    t.index ["stadium_id"], name: "index_ballpark_logs_on_stadium_id"
    t.index ["team_id"], name: "index_ballpark_logs_on_team_id"
    t.index ["user_id"], name: "index_ballpark_logs_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "ballpark_log_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ballpark_log_id"], name: "index_comments_on_ballpark_log_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_teams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_favorite_teams_on_team_id"
    t.index ["user_id"], name: "index_favorite_teams_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.bigint "visitor_team_id", null: false
    t.bigint "home_team_id", null: false
    t.date "date", null: false
    t.integer "visitor_score", null: false
    t.integer "home_score", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["home_team_id"], name: "index_games_on_home_team_id"
    t.index ["visitor_team_id"], name: "index_games_on_visitor_team_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ballpark_log_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stadia", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "initial"
    t.string "last_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "ballpark_logs", "games"
  add_foreign_key "ballpark_logs", "stadia"
  add_foreign_key "ballpark_logs", "teams"
  add_foreign_key "comments", "ballpark_logs"
  add_foreign_key "comments", "users"
  add_foreign_key "favorite_teams", "teams"
  add_foreign_key "favorite_teams", "users"
  add_foreign_key "games", "teams", column: "home_team_id"
  add_foreign_key "games", "teams", column: "visitor_team_id"
end
