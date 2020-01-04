class SeasonsController < ApplicationController
  def create
    puts params[:multiplicity]
  end
  def new
    @teams = Team.all
    @season = Season.new
  end
end
