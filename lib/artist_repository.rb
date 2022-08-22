require_relative "./artist.rb"

class ArtistRepository

 def all
  sql = 'SELECT id, name, genre FROM artists;'
  result_set = DatabaseConnection.exec_params(sql, [])

  all_artists = []
  result_set.each do |record|
   artist = Artist.new
   artist.id = record["id"]
   artist.name = record["name"]
   artist.genre = record["genre"]

   all_artists << artist
   end
   return all_artists
 end


 def find(id)
  sql = 'SELECT id, name, genre FROM artists WHERE id = $1;'
  result_set = DatabaseConnection.exec_params(sql, [id])

  result = result_set[0]

  artist = Artist.new
  artist.id = result["id"]
  artist.name = result["name"]
  artist.genre = result["genre"]

  return artist
 end


 # adds a new artist record using sql query
  def create(artist)
    sql = 'INSERT INTO artists (name, genre) VALUES($1,$2)';
    DatabaseConnection.exec_params(sql, [artist.name, artist.genre])
    return 
  end

 # deletes an artist record using sql query
def delete(id)
  sql = 'DELETE FROM artists WHERE id = $1'
  DatabaseConnection.exec_params(sql, [id])
 return 
end

 # updates a record using query with updated info
 def update(artist)
  sql = 'UPDATE artists SET name = $1, genre = $2 WHERE id = $3;'
  DatabaseConnection.exec_params(sql, [artist.name, artist.genre, artist.id])
  return nil
 end
end