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
end