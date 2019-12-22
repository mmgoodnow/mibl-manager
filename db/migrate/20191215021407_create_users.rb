# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :role
      t.string :email
      t.string :phone
      t.string :name

      t.timestamps
    end
  end
end