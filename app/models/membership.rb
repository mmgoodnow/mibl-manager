# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :season
  belongs_to :team
  belongs_to :player, class_name: 'User'
end
