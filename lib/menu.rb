# rubocop:disable Metrics/CyclomaticComplexity

class Menu
  def initialize(app)
    @app = app
  end

  def display_options
    puts "
  Display:
    1 - List all books
    2 - List all music albums
    3 - List all movies
    4 - List of games
    5 - List all genres (e.g 'Comedy', 'Thriller')
    6 - List all labels (e.g. 'Gift', 'New')
    7 - List all authors (e.g. 'Stephen King')
    8 - List all sources (e.g. 'From a friend', 'Online shop')

  Manage:
    9 - Add a book
    10 - Add a music album
    11 - Add a movie
    12 - Add a game

  0 - Exit
  "
  end

  def perform_action(choice)
    case choice
    when 1 then @app.list_books
    when 2 then @app.list_music_albums
    when 3 then @app.list_movies
    when 4 then @app.list_games
    when 5 then @app.list_genres
    when 6 then @app.list_labels
    when 7 then @app.list_authors
    when 8 then @app.list_sources

    when 9 then @app.add_book
    when 10 then @app.add_music_album
    when 11 then @app.add_movie
    when 12 then @app.add_game
    when 0
      puts 'Thanks for using this app!'
      exit
    else
      puts 'Invalid option. Please choose again.'
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
