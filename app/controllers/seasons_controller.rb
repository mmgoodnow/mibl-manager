class SeasonsController < ApplicationController
  def create
    @season = Season.new(season_params)
    puts @season.name
    roster_params = []
    params[:multiplicity].each do |key, number_of_sub_teams|
      if number_of_sub_teams.to_i > 1
        number_of_sub_teams.to_i.times do |team_number|
          roster_params << { team_id: key, team_number: team_number }
        end
      else
        roster_params << { team_id: key }
      end
    end

    rosters =
      roster_params.map do |obj|
        Roster.new(
          {
            team: Team.find(obj[:team_id]),
            number: obj[:team_number],
            season: @season
          }
        )
      end
    rosters.each { |roster| puts roster.name }
  end

  def new
    @teams = Team.all
    @season = Season.new
  end

  private

  def nth_match(rosters); end

  def reorder_rosters_for_round(rosters, round); end

  def season_params
    params.require(:season).permit(:name, :text)
  end
end
