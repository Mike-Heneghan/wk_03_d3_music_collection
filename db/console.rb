require("pry")
require("pg")

require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new('name' => 'Led Zeppelin')

artist1.save()
artist1.save()
artist1.save()
artist1.save()
# artist1.delete()
# Artist.delete_all()
p Artist.all()
