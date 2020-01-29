class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.date :start
      t.date :end
      t.references :season, null: false, foreign_key: true
      t.string :name
      t.timestamps
    end
  end
end
