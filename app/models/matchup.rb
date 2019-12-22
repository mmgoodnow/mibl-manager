# frozen_string_literal: true

class Matchup < ApplicationRecord
  belongs_to :season
  belongs_to :home_team, class_name: "Team"
  belongs_to :away_team, class_name: "Team"
  has_many :matches, inverse_of: :matchup
end
