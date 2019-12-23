# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :roster, inverse_of: :memberships
  has_one :team, through: :roster
  has_one :season, through: :roster
  belongs_to :player, inverse_of: :memberships, class_name: 'User'
end
