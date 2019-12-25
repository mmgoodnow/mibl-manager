# frozen_string_literal: true

class CreateLineups < ActiveRecord::Migration[6.0]
  def change
    create_table :lineups do |t|
      t.references :roster, null: false, foreign_key: true
      t.references :singles_1, null: false, foreign_key: { to_table: :users }
      t.references :singles_2, null: false, foreign_key: { to_table: :users }
      t.references :singles_3, null: false, foreign_key: { to_table: :users }
      t.references :doubles_1_1, null: false, foreign_key: { to_table: :users }
      t.references :doubles_1_2, null: false, foreign_key: { to_table: :users }
      t.references :doubles_2_1, null: false, foreign_key: { to_table: :users }
      t.references :doubles_2_2, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
