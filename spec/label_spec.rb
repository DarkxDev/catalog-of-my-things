require './label'

describe Label do
  describe '#initialize' do
    it 'creates a new label with id, title, color, items' do
      label = Label.new('title', 'color')
      expect(label.title).to eq('title')
      expect(label.color).to eq('color')
    end
  end

  describe '#add_item' do
    it 'expect to add_item to the items collection' do
      item = Item.new('genre', 'author', 'source', 'label', 'publish_date')
      label = Label.new('title', 'color')
      label.add_item(item)
      expect(label.items.last).to eq(item)
    end
  end
end
