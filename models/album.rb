require ('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'] if options['id']
    @arist_id = options['artist_id'].to_i
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

end
