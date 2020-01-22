# frozen_string_literal: true

class Season < ApplicationRecord
  has_many :rosters, inverse_of: :season
  has_many :teams, through: :rosters
  has_many :memberships, through: :rosters
  has_many :players, through: :memberships

  validates :name, presence: true

  scope :current, -> { order(created_at: :desc).first }
end
