require("pry")
require("pg")

require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new('name' => 'Arcade Fire')

# Artist.delete_all
#
# artist1.save()

# artist1.delete()
# Artist.delete_all()
p Artist.all()
puts ""

p album1 = Album.new('title' => 'The Suburbs', 'genre' => "Indie Rock", 'artist_id' => 1 )

# album1.save()
# album1.delete()
Album.delete_all
