require_relative "./album.rb"

class AlbumRepository

 def all
  sql = 'SELECT title, release_year, artist_id FROM albums;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_albums = []
  result_set.each do |record|
   albums = Album.new
   albums.title = record["title"]
   albums.release_year = record["release_year"]
   albums.artist_id = record["artist_id"]

   all_albums << albums
   end
   return all_albums
 end

  # adds a new album record using sql query
  def create(album)
    sql = 'INSERT INTO albums (title, release_year, artist_id) VALUES($1,$2, $3)';
    DatabaseConnection.exec_params(sql, [album.title, album.release_year, album.artist_id ])
    return 
  end

end