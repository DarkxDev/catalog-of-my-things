require 'date'
require './game'

describe Game do
  let(:genre) { double('genre') }
  let(:author) { double('author') }
  let(:source) { double('source') }
  let(:label) { double('label') }
  let(:publish_date) { double('publish_date') }
  let(:multiplayer) { double('multiplayer') }

  describe '#initialize' do
    it 'creates a new game with multiplayer and last_played_at' do
      multiplayer = true
      last_played_at = Date.today.to_s
      game = Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)

      expect(game.multiplayer).to eq(multiplayer)
      expect(game.last_played_at).to eq(last_played_at)
    end
  end

  describe '#can_be_archived?' do
    it 'expect to return true if Item#can_be_archived? is true AND if last_played_at is older than 2 years' do
      game = Game.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 11),
                      multiplayer, Time.now - (60 * 60 * 24 * 365 * 3))
      expect(game.send(:can_be_archived?)).to eq(true)
    end

    it 'expect to return false if Item#can_be_archived? is true AND if last_played_at is NOT older than 2 years' do
      game = Game.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 11),
                      multiplayer, Time.now - (60 * 60 * 24 * 365 * 1))
      expect(game.send(:can_be_archived?)).to eq(false)
    end
  end
end
