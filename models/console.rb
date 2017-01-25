require('pry-byebug')
require_relative('./album')
require_relative('./artist')


artist1 = Artist.new( { 'name' => 'Rival Schools'})
artist2 = Artist.new( { 'name' => 'Portishead'})
artist3 = Artist.new( { 'name' => 'Manchester Orchestra'})
artist4 = Artist.new( { 'name' => 'Brand New'})
artist5 = Artist.new( { 'name' => 'Grandaddy'})

artist1.save
artist2.save
artist3.save
artist4.save
artist5.save


album1 = Album.new( { 'title' => 'Pedals', 'genre' => 'Post hardcore', 'artist_id' => artist1.id } )

album2 = Album.new( { 'title' => 'Dummy', 'genre' => 'Trip Hop', 'artist_id' => artist2.id } )
album3 = Album.new( { 'title' => 'Portishead', 'genre' => 'Trip Hop', 'artist_id' => artist2.id } )

album4 = Album.new( { 'title' => 'Simple Math', 'genre' => 'Rock', 'artist_id' => artist3.id } )

album5 = Album.new( { 'title' => 'Daisy', 'genre' => 'Rock', 'artist_id' => artist4.id } )
album6 = Album.new( { 'title' => 'Deja Entendu', 'genre' => 'Rock', 'artist_id' => artist4.id } )


album7 = Album.new( { 'title' => 'The Sophtware Slump', 'genre' => 'indie', 'artist_id' => artist5.id } )
album8 = Album.new( { 'title' => 'The Broke Down Comforter Collection', 'genre' => 'indie', 'artist_id' => artist5.id } )


album1.save
album2.save
album3.save
album4.save
album5.save
album6.save
album7.save
album8.save



binding.pry

nil






