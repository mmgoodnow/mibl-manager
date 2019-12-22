# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.references :matchup, null: false, foreign_key: true
      t.string :slot
      t.references :home_player_1, foreign_key: {to_table: :users}
      t.references :home_player_2, foreign_key: {to_table: :users}
      t.references :away_player_1, foreign_key: {to_table: :users}
      t.references :away_player_2, foreign_key: {to_table: :users}
      t.datetime :timestamp
      t.string :status

      t.timestamps
    end
  end
end
