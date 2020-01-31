# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users =
  User.create!(
    [
      {
        name: 'Hunter',
        role: 'admin',
        email: 'hunter@example.com',
        phone: '781-555-5555',
        password: 'hunter2'
      },
      {
        name: 'Michael',
        role: 'captain',
        email: 'michael@example.com',
        phone: '781-666-5555',
        password: 'hunter2'
      },
      {
        name: 'Sean',
        role: 'player',
        email: 'sean@example.com',
        phone: '781-777-5555',
        password: 'hunter2'
      }
    ]
  )
teams =
  Team.create!(
    [
      { name: 'MIT' },
      { name: 'NEU' },
      { name: 'UML' },
      { name: 'WIT' },
      { name: 'BU' }
    ]
  )

seasons = Season.create!([{ name: 'Fall 2019' }])

rosters =
  Roster.create!(
    [
      { team: teams[0], season: seasons[0] },
      { team: teams[1], season: seasons[0] }
    ]
  )

memberships =
  Membership.create!(
    [
      { roster: rosters[0], player: users[0] },
      { roster: rosters[1], player: users[1] }
    ]
  )
