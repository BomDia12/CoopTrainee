# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Artist.create(name: 'Baroes da Pisadinha', age: 5, nationality: 'Brazilian')
Song.create(name: 'Recairei', releasedate: '2020-04-17 00:00:00', explicit: false, artist_id: 1)
