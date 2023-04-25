class Item
  attr_reader :genre, :author, :source, :label

  def initialize(genre, author, source, label)
    @genre = genre
    @author = author
    @source = source
    @label = label
  end
end
