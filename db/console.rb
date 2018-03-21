require("pry")
require("pg")

require_relative("../models/album")
require_relative("../models/artist")



Album.delete_all
Artist.delete_all

artist1 = Artist.new('name' => 'Arcade Fire')
artist2 = Artist.new('name' => 'The XX')

artist1.save()
artist2.save()
# artist1.delete()
# Artist.delete_all()
p Artist.all()
puts ""

album1 = Album.new({'title' => 'The Suburbs', 'genre' => "Indie Rock", 'artist_id' => artist1.id })
album2 = Album.new({'title' => 'The Suburbs', 'genre' => "Indie Rock", 'artist_id' => artist1.id })
album3 = Album.new({'title' => 'Everything Now', 'genre' => "Indie Rock", 'artist_id' => artist1.id })
album4 = Album.new({'title' => 'Reflektor', 'genre' => "Indie Rock", 'artist_id' => artist1.id })

album5 = Album.new({'title' => 'xx', 'genre' => "Indie Electronic", 'artist_id' => artist2.id })
album6 = Album.new({'title' => 'Coexist', 'genre' => "Indie Electronic", 'artist_id' => artist2.id })
album7 = Album.new({'title' => 'I See You', 'genre' => "Indie Electronic", 'artist_id' => artist2.id })



album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()
album7.save()

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

p Artist.find_by_id(7)
puts ""

p Album.find_by_id(9)
puts ""
