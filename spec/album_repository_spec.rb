require "album_repository"

RSpec.describe AlbumRepository do

def reset_albums_table
seed_sql = File.read('spec/seeds_albums.sql')
connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
connection.exec(seed_sql)
end

before(:each) do
reset_albums_table
end

 it "returns list of artists" do
  repo = AlbumRepository.new
  albums = repo.all
  expect(albums.length).to eq 2 # 2
  expect(albums.first.title).to eq "Fly" # 1
  expect(albums.first.release_year).to eq "1992" # Rox
  expect(albums.first.artist_id).to eq "1" # Rox
 end

  it "creates a new album record" do
  repo = AlbumRepository.new
  album = Album.new
  album.title = "Lixies"
  album.release_year = "1995"
  album.artist_id = "7"

  repo.create(album)
  albums = repo.all

  added_album = albums.last
  expect(added_album.title).to eq("Lixies")  # Lixies
  expect(added_album.release_year).to eq("1995") # 1995
  expect(added_album.artist_id).to eq("7") # 1995
 end 
end