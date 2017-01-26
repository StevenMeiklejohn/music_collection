require('pg')
require_relative('../db/sql_runner')


class Artist

  attr_accessor :id, :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end


  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map { |artist| Artist.new( artist ) }
  end


  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    albums = SqlRunner.run( sql )
    result = albums.map { |album| Album.new ( album ) }
    return result
  end

  def update()
    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end


  def self.delete_all()
    sql = "DELETE FROM artists;"
    result = SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM artists WHERE id =#{@id};"
    result = SqlRunner.run(sql)
  end


  def self.find(artist_id)
    sql = "SELECT * FROM artists WHERE id = #{artist_id}"
    result = SqlRunner.run(sql)
    return Artist.new( result ) 
  end




  end
