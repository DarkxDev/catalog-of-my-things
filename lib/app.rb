require_relative '../item'
require_relative './genre'
require_relative './music_album'
require_relative '../game'
require './author'
require './file_handler'

class App
  attr_accessor :genres, :authors, :music_albums, :games

  include FileHandler

  def initialize
    Author.load
    @genres = []
    @authors = Author.all
    @music_albums = []
    @games = []
  end

  def list_genres
    puts 'No genres registered.' if @genres.empty?
    @genres.each { |genre| puts genre.name }
  end

  def list_authors
    if @authors.empty?
      puts 'No authors found'
    else
      puts '### Authors ###'
      @authors.each_with_index { |author, index| puts "#{index + 1} - #{author.first_name} #{author.last_name}" }
    end
  end

  def list_music_albums
    puts 'No albums found.' if @music_albums.empty?
    @music_albums.each do |album|
      puts "
      Genre: #{album.genre}
      Author: #{album.author}
      Source: #{album.source}
      Label: #{album.label}
      Publish Date: #{album.publish_date.strftime('%Y-%m-%d')}
      On Spotify: #{album.on_spotify}
      "
    end
  end

  def list_games
    puts 'No games found.' if @games.empty?
    @games.each do |game|
      puts "
      Genre: #{game.genre}
      Author: #{game.author}
      Source: #{game.source}
      Label: #{game.label}
      Publish Date: #{game.publish_date.strftime('%m-%d-%Y')}
      Multiplayer: #{game.multiplayer}
      Last Played: #{game.last_played_at.strftime('%m/%d/%Y')}
      "
    end
  end

  def user_basic_inputs
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Source: '
    source = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish Date [DD/MM/YYYY]: '
    input = gets.chomp
    publish_date = Date.parse(input)

    [genre, author, source, label, publish_date]
  end

  def add_music_album
    basic_inputs = user_basic_inputs

    print 'Is it on Spotify? [Y/N]: '
    on_spotify = gets.chomp
    case on_spotify
    when 'Y'
      on_spotify = true
    when 'N'
      on_spotify = false
    else
      puts "Invalid input. Please enter 'Y' or 'N'."
    end

    new_music_album = MusicAlbum.new(*basic_inputs, on_spotify)
    @music_albums << new_music_album

    puts 'Album added successfully.'
  end

  def add_game
    basic_inputs = user_basic_inputs

    print 'Is it Multiplayer? [Y/N]: '
    multiplayer = gets.chomp
    case multiplayer
    when 'Y'
      multiplayer = true
    when 'N'
      multiplayer = false
    else
      puts "Invalid input. Please enter 'Y' or 'N'."
    end

    print 'Last Played [DD/MM/YYYY]: '
    input = gets.chomp
    last_played_at = Date.parse(input)

    new_game = Game.new(*basic_inputs, multiplayer, last_played_at)
    @games << new_game
  end

  def add_author
    Author.create
  end

  def exit
    FileHandler.save(@authors, 'authors.json') if @authors.any?
    puts 'Thanks for using this app!'
    exit!
  end
end
