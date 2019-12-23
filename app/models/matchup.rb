# frozen_string_literal: true

class Matchup < ApplicationRecord
  belongs_to :home_roster, class_name: 'Roster'
  belongs_to :away_roster, class_name: 'Roster'
  has_many :matches, inverse_of: :matchup
end
