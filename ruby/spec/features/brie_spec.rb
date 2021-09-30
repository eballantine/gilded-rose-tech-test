require 'gilded_rose'
require 'item'

describe 'Aged Brie' do
  
  context 'value = 50' do
    brie = Item.new('Aged Brie', 10, 50)
    let(:items) { [brie] }
  
    it 'should never have a value over 50' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 50
    end
  end
  
  context 'sell_in > 0' do
    brie = Item.new('Aged Brie', 20, 10)
    let(:items) { [brie] }
  
    it 'should increase in value by 1 each day' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 11
    end
  end
  
  context 'sell_in = 0' do
    brie = Item.new('Aged Brie', 0, 10)
    let(:items) { [brie] }
  
    it 'should increase in value by 2 each day' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 12
    end
  end
end
