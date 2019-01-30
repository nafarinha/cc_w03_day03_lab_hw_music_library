require('pry')
require_relative('../db/sql_runner')
require_relative('album.rb')

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = ([@name])
    results = Sql_runner.run(sql, values)
    @id = results[0]["id"].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    artists = Sql_runner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists where id = $1"
    values = [@id]
    artists = Sql_runner.run(sql, values)
  end





#END OF CLASS
end
