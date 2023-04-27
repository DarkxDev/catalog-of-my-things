require './item'

class Author
  attr_accessor :id, :first_name, :last_name, :items

  def initialize(first_name, last_name)
    @id = Time.now.to_i
    @first_name = first_name
    @last_name = last_name
    @items = []
    Author.all << self
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def self.all
    @all ||= []
  end

  def self.create
    print 'First name: '
    fname = gets.chomp
    print 'Last name: '
    lname = gets.chomp
    author = Author.new(fname, lname)
    puts 'Author created successfully!'
    author
  end

  def self.load
    return unless File.exist?('./data/authors.json')

    authors = FileHandler.read_file('./data/authors.json')
    authors.map do |author_hash|
      Author.new(author_hash['first_name'], author_hash['last_name'])
    end
  end
end
