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

  def create_matches
    if self.away_lineup != nil && self.home_lineup != nil
      default_match_params = {
        status: :NOT_STARTED, home_score: 0, away_score: 0, matchup: self
      }
      all_match_params = []
      all_match_params <<
        default_match_params.merge(
          {
            slot: :SINGLES_1,
            home_player_1: self.home_lineup.singles_1,
            away_player_1: self.away_lineup.singles_1
          }
        )
      all_match_params <<
        default_match_params.merge(
          {
            slot: :SINGLES_2,
            home_player_1: self.home_lineup.singles_2,
            away_player_1: self.away_lineup.singles_2
          }
        )
      all_match_params <<
        default_match_params.merge(
          {
            slot: :SINGLES_3,
            home_player_1: self.home_lineup.singles_3,
            away_player_1: self.away_lineup.singles_3
          }
        )
      all_match_params <<
        default_match_params.merge(
          {
            slot: :DOUBLES_1,
            home_player_1: self.home_lineup.doubles_1_1,
            home_player_2: self.home_lineup.doubles_1_2,
            away_player_1: self.away_lineup.doubles_1_1,
            away_player_2: self.away_lineup.doubles_1_2
          }
        )
      all_match_params <<
        default_match_params.merge(
          {
            slot: :DOUBLES_2,
            home_player_1: self.home_lineup.doubles_2_1,
            home_player_2: self.home_lineup.doubles_2_2,
            away_player_1: self.away_lineup.doubles_2_1,
            away_player_2: self.away_lineup.doubles_2_2
          }
        )
      Match.create!(all_match_params)
    end
  end
end
