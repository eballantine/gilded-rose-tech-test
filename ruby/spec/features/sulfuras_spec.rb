require 'gilded_rose'
require 'item'

describe 'Sulfuras' do
  sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
  let(:items) { [sulfuras] }

  context 'always' do
    it 'should always have a quality value of 80' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 80
    end

    it 'should always have a sell_in of 0' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].sell_in).to eq 0
    end
  end
end
