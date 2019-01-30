require('pry')
require_relative('../db/sql_helper')
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





#END OF CLASS
end
