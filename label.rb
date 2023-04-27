require './item'

class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = Time.now.to_i
    @title = title
    @color = color
    @items = []
    Label.all << self
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end

  def self.all
    @all ||= []
  end

  def self.create
    print 'Title: '
    title = gets.chomp
    print 'Color: '
    color = gets.chomp
    label = Label.new(title, color)
    puts 'Label created successfully!'
    label
  end

  def self.load
    return unless File.exist?('./data/labels.json')

    labels = FileHandler.read_file('./data/labels.json')
    labels.map do |label_hash|
      Label.new(
        label_hash['title'],
        label_hash['color']
      )
    end
  end
end
