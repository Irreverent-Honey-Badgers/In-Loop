# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create(title: 'test 1', start_datetime: '2015-03-23 12:30:00', end_datetime: '2015-03-23 13:30:00', description: 'this should show up on the calendar')
