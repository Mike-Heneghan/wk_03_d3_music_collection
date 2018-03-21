require("pg")
require("pry")
require_relative("sql_runner")

class Artist

  attr_reader :id, :name

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

end
