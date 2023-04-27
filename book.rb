require './item'

class Book < Item
  attr_reader :publisher, :cover_state

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
    Book.all << self
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    return true if @cover_state == 'bad'

    super
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
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    book = Book.new(genre, author, source, label, publish_date, publisher, cover_state)
    puts 'Book created successfully!'
    book
  end

  def self.load
    return unless File.exist?('./data/books.json')

    books = FileHandler.read_file('./data/books.json')
    books.map do |book_hash|
      Book.new(
        book_hash['genre'],
        book_hash['author'],
        book_hash['source'],
        book_hash['label'],
        book_hash['publish_date'],
        book_hash['publisher'],
        book_hash['cover_state']
      )
    end
  end
end
