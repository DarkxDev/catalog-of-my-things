require 'date'
require './item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  # rubocop:disable Metrics/ParameterLists
  def initialize(genre, author, source, label, publish_date, multiplayer, last_played_at)
    super(genre, author, source, label, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
  # rubocop:enable Metrics/ParameterLists

  def can_be_archived?
    super && Time.now - @last_played_at > (60 * 60 * 24 * 365 * 2)
  end
end
