require './item'

describe Item do
  describe '#initialize' do
    let(:genre) { double('genre') }
    let(:author) { double('author') }
    let(:source) { double('source') }
    let(:label) { double('label') }

    it 'creates a new item with genre, author, source, and label' do
      item = Item.new(genre, author, source, label)
      expect(item.genre).to eq genre
      expect(item.author).to eq author
      expect(item.source).to eq source
      expect(item.label).to eq label
    end
  end
end
