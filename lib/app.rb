require_relative '../item'
require_relative './genre'
require_relative './music_album'
require_relative '../game'
require './author'
require './book'
require './label'
require './file_handler'

class App
  attr_accessor :genres, :authors, :music_albums, :games

  include FileHandler

  def initialize
    Author.load
    Book.load
    Game.load
    Label.load
    Genre.load
    MusicAlbum.load

    @authors = Author.all
    @books = Book.all
    @games = Game.all
    @labels = Label.all
    @genres = Genre.all
    @music_albums = MusicAlbum.all
  end

  def list_genres
    if @genres.empty?
      puts 'No genres registered.' 
    else
      puts '### Genres ###'
    @genres.each_with_index { |genre, index| puts "#{index + 1} - #{genre.name}" }
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors found'
    else
      puts '### Authors ###'
      @authors.each_with_index { |author, index| puts "#{index + 1} - #{author.first_name} #{author.last_name}" }
    end
  end

  def list_books
    if @books.empty?
      puts 'No books found'
    else
      puts '### Books ###'
      @books.each_with_index do |book, index|
        puts "
        #{index + 1} - Publisher: #{book.publisher}, Cover state: #{book.cover_state}"
      end
    end
  end

  def list_labels
    if @labels.empty?
      puts 'No labels found'
    else
      puts '### Labels ###'
      @labels.each_with_index do |label, index|
        puts "#{index + 1} - Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts 'No albums found.'
    else
      puts '### Music Albums ###'
      @music_albums.each do |album|
      puts "
      Genre: #{album.genre}
      Author: #{album.author}
      Source: #{album.source}
      Label: #{album.label}
      Publish Date: #{album.publish_date}
      On Spotify: #{album.on_spotify}
      "
    end
    end
  end

  def list_games
    if @games.empty?
      puts 'No games found'
    else
      puts '### Games ###'
      @games.each do |game|
        puts "
        Genre: #{game.genre}
        Author: #{game.author}
        Source: #{game.source}
        Label: #{game.label}
        Publish Date: #{
          game.publish_date
        }
        Multiplayer: #{game.multiplayer}
        Last Played: #{
          game.last_played_at
        }
        "
      end
    end
  end

  def add_genre
    Genre.create
  end

  def add_music_album
    MusicAlbum.create
  end
  
  def add_game
    Game.create
  end

  def add_author
    Author.create
  end

  def add_book
    Book.create
  end

  def add_label
    Label.create
  end

  def exit
    FileHandler.save(@authors, 'authors.json') if @authors.any?
    FileHandler.save(@books, 'books.json') if @books.any?
    FileHandler.save(@games, 'games.json') if @games.any?
    FileHandler.save(@labels, 'labels.json') if @labels.any?
    FileHandler.save(@genres, 'genres.json') if @genres.any?
    FileHandler.save(@music_albums, 'music_albums.json') if @music_albums.any?
    puts 'Thanks for using this app!'
    exit!
  end
end
