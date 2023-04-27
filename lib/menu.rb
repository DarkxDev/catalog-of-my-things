# rubocop:disable Metrics/CyclomaticComplexity

class Menu
  def initialize(app)
    @app = app
  end

  def display_options
    puts "
    What shoudl we do?
    --------------------------
    1 - List all books
    2 - List all music albums
    3 - List of games
    4 - List all genres
    5 - List all labels
    6 - List all authors
    7 - Add a book
    8 - Add a music album
    9 - Add a game
    10 - Add an author
    --------------------------
    0 - Exit
  "
  end

  def perform_action(choice)
    case choice
    when 1 then @app.list_books
    when 2 then @app.list_music_albums
    when 3 then @app.list_games
    when 4 then @app.list_genres
    when 5 then @app.list_labels
    when 6 then @app.list_authors

    when 7 then @app.add_book
    when 8 then @app.add_music_album
    when 9 then @app.add_game
    when 10 then @app.add_author
    when 0 then @app.exit
    else
      puts 'Invalid option. Please choose again.'
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
