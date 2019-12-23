# frozen_string_literal: true

class Matchup < ApplicationRecord
  belongs_to :home_roster, class_name: 'Roster'
  has_one :home_team, through: :home_roster, class_name: 'Team', source: :team
  belongs_to :away_roster, class_name: 'Roster'
  has_one :away_team, through: :away_roster, class_name: 'Team', source: :team
  has_many :matches, inverse_of: :matchup

  def name
    "#{away_team.name}@#{home_team.name}" if home_team && away_team
  end
end
