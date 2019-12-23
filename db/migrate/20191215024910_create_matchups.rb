# frozen_string_literal: true

class CreateMatchups < ActiveRecord::Migration[6.0]
  def change
    create_table :matchups do |t|
      t.references :home_roster, null: false, foreign_key: { to_table: :rosters }
      t.references :away_roster, null: false, foreign_key: { to_table: :rosters }
      t.date :due_date

      t.timestamps
    end
  end
end
