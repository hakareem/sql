require_relative 'lib/database_connection'
require_relative "lib/artist_repository.rb"
require_relative "lib/album_repository.rb"

DatabaseConnection.connect('music_library')

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end

first_artist = artist_repository.find(3)
p first_artist.name
p first_artist.genre

album_repository = AlbumRepository.new

album_repository.all.each do |album|
  p album
end


