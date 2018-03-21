require_relative("artist")

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()

    sql = "
    INSERT INTO albums
    (title,genre,artist_id)
    VALUES ($1,$2,$3)
    RETURNING id;
    "
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def delete()

    sql = "
    DELETE FROM albums
    ;
    "

    SqlRunner.run(sql)
  end

  def self.all()

    sql = "
    SELECT * FROM albums
    ;
    "
    result = SqlRunner.run(sql)
    album_objects = result.map { |album_hash| Album.new(album_hash)  }
    return album_objects
  end

  def self.delete_all()

    sql = "DELETE FROM albums;"

    SqlRunner.run(sql)

  end

  def artist_of_album()

    sql = "SELECT * FROM artists WHERE id = $1"

    values = [@artist_id]

    result = SqlRunner.run(sql,values)
    artist_object = result.map { |artist| Artist.new(artist)  }
    # artist_object = result.first
    return artist_object
  end

  def edit()

    sql = "
    UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3)
    WHERE id = $4
    "
    values = [@title, @genre, @artist_id, @id]

    SqlRunner.run(sql, values)

  end

  def Album.find_by_id(id)

    sql = "SELECT * FROM albums WHERE id = $1"

    values = [id]

    result = SqlRunner.run(sql, values)
    found_object = result.map {|found_hash| Album.new(found_hash)}
    return found_object
  end

end
