# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :matches_as_home_player_1,
           inverse_of: :home_player_1,
           class_name: 'Match',
           foreign_key: 'home_player_1_id'
  has_many :matches_as_home_player_2,
           inverse_of: :home_player_2,
           class_name: 'Match',
           foreign_key: 'home_player_2_id'
  has_many :matches_as_away_player_1,
           inverse_of: :away_player_1,
           class_name: 'Match',
           foreign_key: 'away_player_1_id'
  has_many :matches_as_away_player_2,
           inverse_of: :away_player_2,
           class_name: 'Match',
           foreign_key: 'away_player_2_id'
  has_many :memberships, inverse_of: :player, foreign_key: 'player_id'
  has_many :rosters, through: :memberships

  def matches
    Match.unscoped.participant(self.id)
  end

  def admin?
    self.role == 'admin'
  end

  def captain?
    self.admin? || self.role == 'captain'
  end
end
