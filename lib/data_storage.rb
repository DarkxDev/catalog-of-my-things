require 'json'

module DataStorage
  # Save Methods ---

  def save_data
    save_genres
    save_authors
    save_music_albums
    save_games
  end

  def save_genres
    genres_collection = []
    @genres.each { |genre| genres_collection << { name: genre.name } }
    File.write('genres.json', genres_collection.to_json)
  end

  def save_authors
    authors_collection = []
    @authors.each { |author| authors_collection << { first_name: author.first_name, last_name: author.last_name } }
    File.write('authors.json', authors_collection.to_json)
  end

  def save_music_albums
    music_albums_collection = []
    @music_albums.each do |music_album|
      music_albums_collection << {
        genre: music_album.genre,
        author: music_album.author,
        source: music_album.source,
        label: music_album.label,
        publish_date: music_album.publish_date,
        on_spotify: music_album.on_spotify
      }
    end
    File.write('music_albums.json', music_albums_collection.to_json)
  end

  def save_games
    games_collection = []
    @games.each do |game|
      games_collection << {
        genre: game.genre,
        author: game.author,
        source: game.source,
        label: game.label,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at
      }
    end
    File.write('games.json', games_collection.to_json)
  end
end
