require './item'

describe Item do
  let(:genre) { double('genre') }
  let(:author) { double('author') }
  let(:source) { double('source') }
  let(:label) { double('label') }
  let(:publish_date) { double('publish_date') }

  describe '#initialize' do
    it 'creates a new item with genre, author, source, and label' do
      item = Item.new(genre, author, source, label, publish_date)
      expect(item.genre).to eq genre
      expect(item.author).to eq author
      expect(item.source).to eq source
      expect(item.label).to eq label
      expect(item.publish_date).to eq publish_date
    end
  end

  describe '#can_be_archived?' do
    it 'expect to return true if publish_date is older than 10 years' do
      item = Item.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 11))
      expect(item.can_be_archived?).to eq(true)
    end

    it 'expect to return false if publish_date is not older than 10 years' do
      item = Item.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 9))
      expect(item.can_be_archived?).to eq(false)
    end
  end
end
