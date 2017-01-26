require('pg')
require_relative('../db/sql_runner')

class Album

  attr_accessor :title, :genre, :artist_id

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) returning *;"
    result = SqlRunner.run(sql)
    @id = result.first['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    albums = SqlRunner.run(sql)
    return albums.map { |album| Album.new( album ) }
  end


  def artist()
    sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
    artist = SqlRunner.run( sql ).first
    result = Artist.new( artist )
    return result
  end

  def update()
    sql = "UPDATE albums SET (title, genre, artist_id) = ('#{@title}', '#{@genre}', #{@artist_id} ) WHERE id = #{@id};"
    result = SqlRunner.run(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    result = SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id =#{@id};"
    result = SqlRunner.run(sql)
  end



end
