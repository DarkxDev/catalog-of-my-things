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
end
