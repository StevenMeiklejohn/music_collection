require('pg')

class Album

  attr_reader :title, :genre, :artist_id

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

end
