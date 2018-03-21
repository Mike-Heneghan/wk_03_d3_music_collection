require("pg")
require("pry")
require_relative("sql_runner")
require_relative("album")

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)

    @id = options['id']
    @name = options['name']

  end

  def save()

    sql = "
    INSERT INTO artists (name)
    VALUES ($1)
    RETURNING id
    ;
    "
    values = [@name]

    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i

  end

  def delete()

    sql = "
    DELETE FROM artists
    ;
    "

    SqlRunner.run(sql)
  end

  def self.delete_all()

    sql = "
    DELETE FROM artists
    ;
    "
    SqlRunner.run(sql)

  end

  def self.all()

    sql = "
    SELECT * FROM artists
    ;
    "
    result = SqlRunner.run(sql)
    artist_objects = result.map { |artist_hash| Artist.new(artist_hash)  }
    return artist_objects
  end

  def albums_by_artist()

    sql = "
    SELECT * FROM albums WHERE artist_id = $1
    "
    values =[@id]

    results_hashes = SqlRunner.run(sql, values)
    album_objects = results_hashes.map { |album_hash| Album.new(album_hash)  }

    return album_objects

  end

  def edit()

    sql = "
    UPDATE artists SET name = $1 WHERE id = $2"

    values = [@name, @id]

    SqlRunner.run(sql, values)

  end

  def Artist.find_by_id(id)

    sql = "
    SELECT * FROM artists WHERE id = $1
    "
    values = [id]

    result = SqlRunner.run(sql, values)
    found_object = result.map { |found| Artist.new(found)}
    return found_object

  end


end
