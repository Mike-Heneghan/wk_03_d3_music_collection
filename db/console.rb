require("pry")
require("pg")

require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new('name' => 'Arcade Fire')

Album.delete_all
Artist.delete_all

#
artist1.save()

# artist1.delete()
# Artist.delete_all()
p Artist.all()
puts ""

album1 = Album.new({'title' => 'The Suburbs', 'genre' => "Indie Rock", 'artist_id' => artist1.id })


album1.save()

p Album.all()
puts ""

# album1.delete()
# Album.delete_all
p artist1.albums_by_artist()
puts ""

p album1.artist_of_album()
puts ""

album1.title = "Neon Bible"
album1.edit()
p Album.all()
puts ""

artist1.name = "Arcade Fire!"
artist1.edit()
p Artist.all()
puts ""

p Artist.find_by_id(26)
puts ""

p Album.find_by_id(26)
puts ""
