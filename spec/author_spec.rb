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

  describe '#add_item' do
    it 'expect to add_item to the items collection' do
      item = Item.new('genre', 'author', 'source', 'label', 'publish_date')
      author = Author.new('John', 'Doe')
      author.add_item(item)

      expect(author.items.last).to eq(item)
    end
  end
end
