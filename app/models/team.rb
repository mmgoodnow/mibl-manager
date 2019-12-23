# frozen_string_literal: true

class Team < ApplicationRecord
  has_many :rosters, inverse_of: :team
  has_many :seasons, through: :rosters
  has_many :memberships, through: :rosters
  has_many :players, through: :memberships
end
