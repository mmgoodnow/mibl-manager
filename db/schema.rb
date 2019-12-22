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

ActiveRecord::Schema.define(version: 2019_12_15_025149) do

  create_table "matches", force: :cascade do |t|
    t.integer "matchup_id", null: false
    t.string "slot"
    t.integer "home_player_1_id"
    t.integer "home_player_2_id"
    t.integer "away_player_1_id"
    t.integer "away_player_2_id"
    t.datetime "timestamp"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_player_1_id"], name: "index_matches_on_away_player_1_id"
    t.index ["away_player_2_id"], name: "index_matches_on_away_player_2_id"
    t.index ["home_player_1_id"], name: "index_matches_on_home_player_1_id"
    t.index ["home_player_2_id"], name: "index_matches_on_home_player_2_id"
    t.index ["matchup_id"], name: "index_matches_on_matchup_id"
  end

  create_table "matchups", force: :cascade do |t|
    t.integer "season_id", null: false
    t.integer "home_team_id", null: false
    t.integer "away_team_id", null: false
    t.date "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_team_id"], name: "index_matchups_on_away_team_id"
    t.index ["home_team_id"], name: "index_matchups_on_home_team_id"
    t.index ["season_id"], name: "index_matchups_on_season_id"
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "season_id", null: false
    t.integer "team_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_memberships_on_player_id"
    t.index ["season_id"], name: "index_memberships_on_season_id"
    t.index ["team_id"], name: "index_memberships_on_team_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "role"
    t.string "email"
    t.string "phone"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "matches", "matchups"
  add_foreign_key "matches", "users", column: "away_player_1_id"
  add_foreign_key "matches", "users", column: "away_player_2_id"
  add_foreign_key "matches", "users", column: "home_player_1_id"
  add_foreign_key "matches", "users", column: "home_player_2_id"
  add_foreign_key "matchups", "seasons"
  add_foreign_key "matchups", "teams", column: "away_team_id"
  add_foreign_key "matchups", "teams", column: "home_team_id"
  add_foreign_key "memberships", "seasons"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users", column: "player_id"
end
