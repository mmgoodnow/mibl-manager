# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :matchup, inverse_of: :matches
  belongs_to :home_player_1,
             class_name: 'User',
             inverse_of: :matches_as_home_player_1,
             optional: false
  belongs_to :home_player_2,
             class_name: 'User',
             inverse_of: :matches_as_home_player_2,
             optional: true
  belongs_to :away_player_1,
             class_name: 'User',
             inverse_of: :matches_as_away_player_1,
             optional: false
  belongs_to :away_player_2,
             class_name: 'User',
             inverse_of: :matches_as_away_player_2,
             optional: true
  enum status: {
         NOT_STARTED: 'NOT_STARTED',
         COMPLETED: 'COMPLETED',
         FORFEIT: 'FORFEIT',
         IN_PROGRESS: 'IN_PROGRESS'
       }
  enum slot: {
         SINGLES_1: 'SINGLES_1',
         SINGLES_2: 'SINGLES_2',
         SINGLES_3: 'SINGLES_3',
         DOUBLES_1: 'DOUBLES_1',
         DOUBLES_2: 'DOUBLES_2'
       }

  scope :participant,
        lambda { |player_id|
          where(
            'home_player_1_id = ? OR home_player_2_id = ? OR away_player_1_id = ? OR away_player_2_id = ?',
            player_id,
            player_id,
            player_id,
            player_id
          )
        }
end
