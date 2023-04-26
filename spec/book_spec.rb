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

  describe '#can_be_archived?' do
    it 'expect to return true if Item#can_be_archived? is true' do
      book = Book.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 11), publisher, 'good')
      expect(book.send(:can_be_archived?)).to eq(true)
    end

    it 'expect to return true if cover_state equals "bad"' do
      book = Book.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 9), publisher, 'bad')
      expect(book.send(:can_be_archived?)).to eq(true)
    end

    it 'expect to return false if if Item#can_be_archived? is false and cover_state equals "good"' do
      book = Book.new(genre, author, source, label, Time.now - (60 * 60 * 24 * 365 * 9), publisher, 'good')
      expect(book.send(:can_be_archived?)).to eq(false)
    end
  end

  describe '#all' do
    it 'returns an array of created books' do
      count = Book.all.length
      book = Book.new(genre, author, source, label, publish_date, publisher, 'good')
      expect(count).to eq(count + 1)
    end
  end
end
