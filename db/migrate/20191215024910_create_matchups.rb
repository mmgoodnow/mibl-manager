# frozen_string_literal: true

class CreateMatchups < ActiveRecord::Migration[6.0]
  def change
    create_table :matchups do |t|
      t.references :season, null: false, foreign_key: true
      t.references :home_team, null: false, foreign_key: {to_table: :teams}
      t.references :away_team, null: false, foreign_key: {to_table: :teams}
      t.date :due_date

      t.timestamps
    end
  end
end
