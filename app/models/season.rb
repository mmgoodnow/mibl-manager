# frozen_string_literal: true

class Season < ApplicationRecord
  has_many :rosters, inverse_of: :season
  accepts_nested_attributes_for :rosters
  has_many :teams, through: :rosters
  has_many :memberships, through: :rosters
  has_many :players, through: :memberships

  scope :current, -> { order(created_at: :desc).first }
end
