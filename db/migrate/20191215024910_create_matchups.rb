# frozen_string_literal: true

class CreateMatchups < ActiveRecord::Migration[6.0]
  def change
    create_table :matchups do |t|
      t.references :home_roster,
                   null: false, foreign_key: { to_table: :rosters }
      t.references :away_roster,
                   null: false, foreign_key: { to_table: :rosters }
      t.references :home_lineup, foreign_key: { to_table: :lineups }
      t.references :away_lineup, foreign_key: { to_table: :lineups }
      t.references :round, foreign_key: true

      t.timestamps
    end
  end
end
