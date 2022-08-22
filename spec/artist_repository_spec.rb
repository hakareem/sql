require "artist_repository"

RSpec.describe ArtistRepository do

def reset_artists_table
seed_sql = File.read('spec/seeds_artists.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
connection.exec(seed_sql)
end

before(:each) do
reset_artists_table
end

 it "returns list of artists" do
  repo = ArtistRepository.new
  artists = repo.all
  expect(artists.length).to eq 2 # 2
  expect(artists.first.id).to eq "1" # 1
  expect(artists.first.name).to eq "Rox" # Rox
 end

 it "returns a single artist" do
   repo = ArtistRepository.new
  artist = repo.find(1)
  expect(artist.id).to eq "1" # 1
  expect(artist.name).to eq "Rox" # Rox
  expect(artist.genre).to eq "Pop" # Rox
 end

 it "creates a new artist record" do
  repo = ArtistRepository.new
  artist = Artist.new
  artist.name = "Lixies"
  artist.genre = "Lop"

  repo.create(artist)
  artists = repo.all

  added_artist = artists.last
  expect(added_artist.name).to eq("Lixies")  # Lixies
  expect(added_artist.genre).to eq("Lop") # Lop
 end


 it "deletes an artist from the list" do
   repo = ArtistRepository.new
   the_artist = repo.find(1)

   repo.delete(the_artist.id)

   all_artists = repo.all
   expect(all_artists.length).to eq(1) # 1
   expect(all_artists.first.id).to eq("2") # 2
 end

 it "updates an artist information" do
   repo = ArtistRepository.new

   artist = repo.find(1)

   artist.name = "Jakie Chan"
   artist.genre = "Idk"

   repo.update(artist)
   new_artist = repo.find(1)

   expect(new_artist.name).to eq("Jakie Chan")  # "Jakie Chan"
   expect(new_artist.genre).to eq("Idk") # "Idk"
 end
end