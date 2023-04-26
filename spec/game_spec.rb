require 'date'
require './game'

describe Game do
  let(:genre) { double('genre') }
  let(:author) { double('author') }
  let(:source) { double('source') }
  let(:label) { double('label') }
  let(:publish_date) { double('publish_date') }

  describe '#initialize' do
    it 'creates a new game with multiplayer and last_played_at' do
      multiplayer = true
      last_played_at = Date.today.to_s
      game = Game.new(genre, author, source, label, publish_date, multiplayer, last_played_at)

      expect(game.multiplayer).to eq(multiplayer)
      expect(game.last_played_at).to eq(last_played_at)
    end
  end
end
