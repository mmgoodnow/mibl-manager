class SeasonsController < ApplicationController
  def create
    @season = Season.create!(season_params)
    puts @season.inspect

    roster_params = gen_roster_params
    rosters = create_rosters(roster_params)
    rounds = gen_rounds(rosters)
    matchups = gen_all_matchups(rosters, rounds)
  end

  def new
    @teams = Team.all
    @season = Season.new
  end

  private

  def gen_all_matchups(rosters, rounds)
    matchups = []
    rounds.each_index do |i|
      round = rounds[i]
      matchups_this_round = gen_matchups(i, rosters, round)
      matchups.concat(matchups_this_round)
    end
    matchups
  end

  def gen_rounds(rosters)
    rounds = []
    number_of_rounds = number_of_rounds(rosters)
    number_of_rounds.times do |i|
      round_start = start_date + (i * params[:round_length].to_i)
      round_end = round_start + params[:round_length].to_i
      round_params = {
        season: @season,
        name: "Round #{i + 1}",
        start: round_start,
        end: round_end
      }
      round = Round.create!(round_params)
      rounds << round
    end
    rounds
  end

  def gen_matchups(round_number, rosters, round)
    rosters_with_bye = setup_round_robin_table(rosters)
    round_robin_config = nth_round_config(rosters_with_bye, round_number)
    matchup_rosters = matchups_for_round(round_robin_config, round_number)
    matchup_rosters.map do |home_and_away_rosters|
      home, away = home_and_away_rosters
      puts "home #{home.inspect} away #{away.inspect}"
      matchup_params = { home_roster: home, away_roster: away, round: round }
      Matchup.create!(matchup_params)
    end
  end

  def start_date
    ymd = params[:start_date]
    Date.new(ymd[:year].to_i, ymd[:month].to_i, ymd[:day].to_i)
  end

  def create_rosters(roster_params)
    roster_params.map do |obj|
      Roster.create!(
        {
          team: Team.find(obj[:team_id]),
          number: obj[:team_number],
          season: @season
        }
      )
    end
  end

  def gen_roster_params
    roster_params = []
    params[:multiplicity].each do |key, number_of_sub_teams|
      if number_of_sub_teams.to_i > 1
        number_of_sub_teams.to_i.times do |team_number|
          roster_params << { team_id: key, team_number: team_number + 1 }
        end
      else
        roster_params << { team_id: key }
      end
    end
    roster_params
  end

  def matchups_for_round(rosters, round)
    matchups =
      (0...(rosters.length / 2)).map do |i|
        left = rosters[i]
        right = rosters[rosters.length - i - 1]
        # so one team isn't always home or away
        round.even? ? [left, right] : [right, left]
      end

    matchups.shift if matchups[0].include?(:bye)
    matchups
  end

  def setup_round_robin_table(rosters)
    mut_rosters = rosters.dup
    mut_rosters.unshift(:bye) if mut_rosters.length.odd?
    mut_rosters
  end

  def number_of_rounds(rosters)
    rosters.length.even? ? rosters.length - 1 : rosters.length
  end

  def nth_round_config(rosters, round)
    output = rosters.dup
    first = output.shift
    output = output.rotate(round)
    output.unshift(first)
    output
  end

  def season_params
    params.require(:season).permit(:name, :text)
  end
end
