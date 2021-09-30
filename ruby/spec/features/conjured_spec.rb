require 'gilded_rose'
require 'item'

describe 'Conjured' do
  conjured = Item.new('Conjured', 10, 30)
  let(:items) { [conjured] }

  context 'always' do
    it 'should decrease in quality by 2 each day' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 28
    end
  end
end
