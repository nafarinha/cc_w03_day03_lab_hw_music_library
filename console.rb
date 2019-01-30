require('pry')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist_1 = Artist.new({'name' => 'Michael Jackson'})
artist_2 = Artist.new({'name' => 'Britney Spears'})

artist_1.save()
artist_2.save()

album_1 = Album.new({
  'title' => 'Black and White',
  'genre' => 'Classic-Pop',
  'artist_id' => artist_1.id

  })
album_2 = Album.new({
  'title' => 'Thriller',
  'genre' => 'Classic-Pop',
  'artist_id' => artist_1.id
  })

album_3 = Album.new({
  'title' => 'Toxic',
  'genre' => 'Modern Pop',
  'artist_id' => artist_2.id
  })

  album_1.save()
  album_2.save()
  album_3.save()

  album_1.genre = 'Rock'
  album_1.update()

  artist_1.name = 'Tim Jackson'
  artist_1.update()

artists = Artist.all()
albums = Album.all()
  #p album_1.artist()
