# frozen_string_literal: true

class Season < ApplicationRecord
  has_many :matchups
  has_many :matches, through: :matchups
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :players, through: :memberships
end
