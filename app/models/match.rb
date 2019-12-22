# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :matchup
  belongs_to :home_player_1, class_name: 'User'
  belongs_to :home_player_2, class_name: 'User'
  belongs_to :away_player_1, class_name: 'User'
  belongs_to :away_player_2, class_name: 'User'
end
