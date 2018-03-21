class Album
  attr_reader :id, :title, :genre, :artist_id

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
    ;
    "
    values = [@title, @genre, @artist_id]

    SqlRunner.run(sql, values)
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
end
