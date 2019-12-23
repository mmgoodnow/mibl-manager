# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.references :roster, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
