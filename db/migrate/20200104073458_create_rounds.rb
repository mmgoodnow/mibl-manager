class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.datetime :start
      t.datetime :end
      t.references :season, null: false, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
