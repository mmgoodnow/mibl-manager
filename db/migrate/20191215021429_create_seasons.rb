# frozen_string_literal: true

class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :name

      t.timestamps
    end
  end
end
