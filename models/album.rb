require ('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'] if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = Sql_runner.run(sql, values)
    artist_data = results[0]
    return Artist.new(artist_data)
  end

  def save()
    sql = "INSERT INTO albums
    (
      title, genre, artist_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = ([@title, @genre, @artist_id])
    results = Sql_runner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = Sql_runner.run(sql)
    return albums.map { |album| Album.new(album) }
  end

  def update()
  sql = "
  UPDATE albums SET (
    title,
    genre
  ) =
  (
    $1,$2
  )
  WHERE id = $3"
  values = [@title, @genre, @id]
  Sql_runner.run(sql, values)
  end


  def self.delete_all()
    sql = "DELETE FROM albums"
    albums = Sql_runner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums where id = $1"
    values = [@id]
    albums = Sql_runner.run(sql, values)
  end

end
