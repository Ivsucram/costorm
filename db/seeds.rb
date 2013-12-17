# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
traco = Project.create(name:'TRACO')
user1 = User.create(name:'Marcus')
user2 = User.create(name:'Hani')
user3 = User.create(name:'Nico')