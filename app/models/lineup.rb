# frozen_string_literal: true

class Lineup < ApplicationRecord
  belongs_to :roster
  belongs_to :singles_1, class_name: 'User'
  belongs_to :singles_2, class_name: 'User'
  belongs_to :singles_3, class_name: 'User'
  belongs_to :doubles_1_1, class_name: 'User'
  belongs_to :doubles_1_2, class_name: 'User'
  belongs_to :doubles_2_1, class_name: 'User'
  belongs_to :doubles_2_2, class_name: 'User'
end
