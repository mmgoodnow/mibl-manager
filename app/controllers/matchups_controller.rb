class MatchupsController < ApplicationController
  def show
    @matchup = Matchup.find(params[:id])
  end
end
