require 'date'
require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    Game.all << self
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    super && Time.now - @last_played_at > (60 * 60 * 24 * 365 * 2)
  end

  def self.all
    @all ||= []
  end

  def self.create
    print 'Genre: '
    genre = gets.chomp
    print 'Author: '
    author = gets.chomp
    print 'Source: '
    source = gets.chomp
    print 'Label: '
    label = gets.chomp
    print 'Publish date: '
    publish_date = gets.chomp
    print 'Multiplayer: '
    multiplayer = gets.chomp
    print 'Last played at: '
    last_played_at = gets.chomp
    game = Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)
    puts 'Game created successfully!'
    game
  end

  def self.load
    return unless File.exist?('./data/games.json')

    games = FileHandler.read_file('./data/games.json')
    games.map do |game_hash|
      Game.new(
        game_hash['genre'],
        game_hash['author'],
        game_hash['source'],
        game_hash['label'],
        game_hash['publish_date'],
        game_hash['multiplayer'],
        game_hash['last_played_at']
      )
    end
  end
end
