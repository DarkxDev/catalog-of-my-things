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
end
