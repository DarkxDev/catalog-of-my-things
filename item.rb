class Item
  attr_reader :genre, :author, :source, :label, :publish_date

  def initialize(genre, author, source, label, publish_date)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
  end

  private

  def can_be_archived?
    Time.now - publish_date > (60 * 60 * 24 * 365 * 10)
  end
end
