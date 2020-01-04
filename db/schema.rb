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

ActiveRecord::Schema.define(version: 2020_01_04_073458) do
  create_table 'lineups', force: :cascade do |t|
    t.integer 'roster_id', null: false
    t.integer 'singles_1_id', null: false
    t.integer 'singles_2_id', null: false
    t.integer 'singles_3_id', null: false
    t.integer 'doubles_1_1_id', null: false
    t.integer 'doubles_1_2_id', null: false
    t.integer 'doubles_2_1_id', null: false
    t.integer 'doubles_2_2_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[doubles_1_1_id], name: 'index_lineups_on_doubles_1_1_id'
    t.index %w[doubles_1_2_id], name: 'index_lineups_on_doubles_1_2_id'
    t.index %w[doubles_2_1_id], name: 'index_lineups_on_doubles_2_1_id'
    t.index %w[doubles_2_2_id], name: 'index_lineups_on_doubles_2_2_id'
    t.index %w[roster_id], name: 'index_lineups_on_roster_id'
    t.index %w[singles_1_id], name: 'index_lineups_on_singles_1_id'
    t.index %w[singles_2_id], name: 'index_lineups_on_singles_2_id'
    t.index %w[singles_3_id], name: 'index_lineups_on_singles_3_id'
  end

  create_table 'matches', force: :cascade do |t|
    t.integer 'matchup_id', null: false
    t.integer 'home_player_1_id'
    t.integer 'home_player_2_id'
    t.integer 'away_player_1_id'
    t.integer 'away_player_2_id'
    t.datetime 'timestamp'
    t.string 'slot'
    t.string 'status', null: false
    t.integer 'home_score', null: false
    t.integer 'away_score', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[away_player_1_id], name: 'index_matches_on_away_player_1_id'
    t.index %w[away_player_2_id], name: 'index_matches_on_away_player_2_id'
    t.index %w[home_player_1_id], name: 'index_matches_on_home_player_1_id'
    t.index %w[home_player_2_id], name: 'index_matches_on_home_player_2_id'
    t.index %w[matchup_id], name: 'index_matches_on_matchup_id'
  end

  create_table 'matchups', force: :cascade do |t|
    t.integer 'home_roster_id', null: false
    t.integer 'away_roster_id', null: false
    t.integer 'home_lineup_id'
    t.integer 'away_lineup_id'
    t.integer 'round_id'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[away_lineup_id], name: 'index_matchups_on_away_lineup_id'
    t.index %w[away_roster_id], name: 'index_matchups_on_away_roster_id'
    t.index %w[home_lineup_id], name: 'index_matchups_on_home_lineup_id'
    t.index %w[home_roster_id], name: 'index_matchups_on_home_roster_id'
    t.index %w[round_id], name: 'index_matchups_on_round_id'
  end

  create_table 'memberships', force: :cascade do |t|
    t.integer 'roster_id', null: false
    t.integer 'player_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[player_id], name: 'index_memberships_on_player_id'
    t.index %w[roster_id], name: 'index_memberships_on_roster_id'
  end

  create_table 'rosters', force: :cascade do |t|
    t.integer 'season_id', null: false
    t.integer 'team_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[season_id], name: 'index_rosters_on_season_id'
    t.index %w[team_id], name: 'index_rosters_on_team_id'
  end

  create_table 'rounds', force: :cascade do |t|
    t.datetime 'start'
    t.datetime 'end'
    t.integer 'season_id', null: false
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[season_id], name: 'index_rounds_on_season_id'
  end

  create_table 'seasons', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'teams', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'role'
    t.string 'phone'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index %w[email], name: 'index_users_on_email', unique: true
    t.index %w[reset_password_token],
            name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'lineups', 'rosters'
  add_foreign_key 'lineups', 'users', column: 'doubles_1_1_id'
  add_foreign_key 'lineups', 'users', column: 'doubles_1_2_id'
  add_foreign_key 'lineups', 'users', column: 'doubles_2_1_id'
  add_foreign_key 'lineups', 'users', column: 'doubles_2_2_id'
  add_foreign_key 'lineups', 'users', column: 'singles_1_id'
  add_foreign_key 'lineups', 'users', column: 'singles_2_id'
  add_foreign_key 'lineups', 'users', column: 'singles_3_id'
  add_foreign_key 'matches', 'matchups'
  add_foreign_key 'matches', 'users', column: 'away_player_1_id'
  add_foreign_key 'matches', 'users', column: 'away_player_2_id'
  add_foreign_key 'matches', 'users', column: 'home_player_1_id'
  add_foreign_key 'matches', 'users', column: 'home_player_2_id'
  add_foreign_key 'matchups', 'lineups', column: 'away_lineup_id'
  add_foreign_key 'matchups', 'lineups', column: 'home_lineup_id'
  add_foreign_key 'matchups', 'rosters', column: 'away_roster_id'
  add_foreign_key 'matchups', 'rosters', column: 'home_roster_id'
  add_foreign_key 'matchups', 'rounds'
  add_foreign_key 'memberships', 'rosters'
  add_foreign_key 'memberships', 'users', column: 'player_id'
  add_foreign_key 'rosters', 'seasons'
  add_foreign_key 'rosters', 'teams'
  add_foreign_key 'rounds', 'seasons'
end
