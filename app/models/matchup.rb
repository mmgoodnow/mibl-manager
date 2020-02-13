# frozen_string_literal: true

class Matchup < ApplicationRecord
  belongs_to :round, inverse_of: :matchups
  belongs_to :home_roster, class_name: 'Roster'
  has_one :home_team, through: :home_roster, class_name: 'Team', source: :team
  belongs_to :away_roster, class_name: 'Roster'
  has_one :away_team, through: :away_roster, class_name: 'Team', source: :team
  belongs_to :home_lineup, class_name: 'Lineup', optional: true
  belongs_to :away_lineup, class_name: 'Lineup', optional: true
  has_many :matches, inverse_of: :matchup, dependent: :destroy

  after_update :create_matches

  def name
    "#{away_roster.name}@#{home_roster.name}" if home_team && away_team
  end

  private

  def create_matches
    if self.away_lineup != nil && self.home_lineup != nil
      puts 'Valid'
    else
      puts 'Invalid'
    end
  end
end
