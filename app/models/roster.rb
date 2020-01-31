# frozen_string_literal: true

class Roster < ApplicationRecord
  belongs_to :season, inverse_of: :rosters
  belongs_to :team, inverse_of: :rosters
  has_many :memberships, inverse_of: :roster
  has_many :players, through: :memberships

  def name
    number ? "#{team.name}#{self.number}" : "#{team.name}" if team
  end
end
