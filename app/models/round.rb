class Round < ApplicationRecord
  belongs_to :season
  has_many :matchups, inverse_of: :round
end
