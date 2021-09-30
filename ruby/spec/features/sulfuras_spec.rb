require 'gilded_rose'

describe 'Sulfuras' do
  context 'sell_in > 0' do
    sulfuras = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
    let(:items) { [sulfuras] }
  
    it 'should always have a quality value of 80' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 80
    end
  end
end
