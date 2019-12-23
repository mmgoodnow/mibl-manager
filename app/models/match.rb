# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :matchup, inverse_of: :matches
  belongs_to :home_player_1, class_name: 'User', inverse_of: :matches_as_home_player_1, optional: true
  belongs_to :home_player_2, class_name: 'User', inverse_of: :matches_as_home_player_2, optional: true
  belongs_to :away_player_1, class_name: 'User', inverse_of: :matches_as_away_player_1, optional: true
  belongs_to :away_player_2, class_name: 'User', inverse_of: :matches_as_away_player_2, optional: true
end
