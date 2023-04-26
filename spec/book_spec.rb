require './book'

describe Book do
  let(:publisher) { double('publisher') }

  describe '#initialize' do
    it 'creates a new book with publisher and cover_state' do
      book = Book.new(publisher, 'good')
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq('good')
    end
  end
end
