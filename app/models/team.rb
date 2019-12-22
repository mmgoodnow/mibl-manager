# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :matchups_as_home_team, inverse_of: :home_team
  has_many :matchups_as_away_team, inverse_of: :away_team
  has_many :memberships
  has_many :seasons, through: :memberships
  has_many :players, through: :memberships
end
