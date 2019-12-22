# frozen_string_literal: true

class User < ApplicationRecord
  has_many :matches_as_home_player_1, inverse_of: :home_player_1
  has_many :matches_as_home_player_2, inverse_of: :home_player_2
  has_many :matches_as_away_player_1, inverse_of: :away_player_1
  has_many :matches_as_away_player_2, inverse_of: :away_player_2
end
