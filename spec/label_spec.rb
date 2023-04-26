require './label'

describe Label do
  describe '#initialize' do
    it 'creates a new label with id, title, color, items' do
      label = Label.new('title', 'color')
      expect(label.title).to eq('title')
      expect(label.color).to eq('color')
    end
  end
end
