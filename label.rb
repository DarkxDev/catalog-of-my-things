class Label
  attr_reader :id, :title, :color, :items

  def initialize(title, color)
    @id = Time.now.to_i
    @title = title
    @color = color
    @items = []
  end
end
