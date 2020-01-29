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

    number_of_rounds = number_of_rounds(rosters)
    ymd = params[:start_date]
    start = Date.new(ymd[:year].to_i, ymd[:month].to_i, ymd[:day].to_i)
    rounds = []
    (1..number_of_rounds).each do |i|
      round_end = start + (i * params[:round_length].to_i)
      round_start = round_end - params[:round_length].to_i
      rounds <<
        Round.new(
          {
            season: @season,
            name: "Round #{i}",
            start: round_start,
            end: round_end
          }
        )
    end
    puts rounds.inspect
    setup_round_robin_table(rosters)
  end

  def new
    @teams = Team.all
    @season = Season.new
  end

  private

  def nth_match_for_round(rosters, n, round)
    if round.even?
      [rosters[n], rosters[rosters.length - n - 1]]
    else
      [rosters[rosters.length - n - 1], rosters[n]]
    end
  end

  def setup_round_robin_table(rosters)
    rosters.unshift(:bye) if rosters.length.odd?
    rosters
  end

  def number_of_rounds(rosters)
    rosters.length.even? ? rosters.length - 1 : rosters.length
  end

  def nth_round(rosters, round)
    output = rosters.dup
    first = output.shift
    output = output.rotate(round - 1)
    output.unshift(first)
    output
  end

  def season_params
    params.require(:season).permit(:name, :text)
  end
end
