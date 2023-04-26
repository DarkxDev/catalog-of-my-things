require './book'

describe Book do
  let(:genre) { double('genre') }
  let(:author) { double('author') }
  let(:source) { double('source') }
  let(:label) { double('label') }
  let(:publish_date) { double('publish_date') }
  let(:publisher) { double('publisher') }

  describe '#initialize' do
    it 'creates a new book with publisher and cover_state' do
      book = Book.new(genre, author, source, label, publish_date, publisher, 'good')
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq('good')
    end
  end
end
