# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

group = Group.create(name: "2101", retardment: 0, time_limit: "10:15")
group.classdays.create(day: "Lunes", begin_time: "08:00", end_time: "10:00")
group.classdays.create(day: "Viernes", begin_time: "12:00", end_time: "14:00")
