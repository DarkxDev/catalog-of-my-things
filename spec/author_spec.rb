require './author'

describe Author do
  describe '#initialize' do
    it 'creates a new author with id, first_name, last_name, items' do
      author = Author.new('John', 'Doe')
      author.id = 5

      expect(author).to have_attributes(first_name: 'John', last_name: 'Doe', items: [])
      expect(author.id).to eq(5)
    end
  end
end
