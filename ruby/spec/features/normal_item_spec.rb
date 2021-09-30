require 'gilded_rose'
require 'item'

describe 'Normal Item' do

  context 'sell_in > 0' do
    bread = Item.new('Bread', 10, 10)
    let(:items) { [bread] }
  
    it 'should decrease in value by 1 each day' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 9
      expect(items[0].sell_in).to eq 9
    end

    it 'should decrease in sell_in by 1 each day' do
      expect(items[0].sell_in).to eq 9
    end
  end

  context 'sell_in = 0' do
    bread = Item.new('Bread', 0, 10)
    let(:items) { [bread] }
  
    it 'should decrease in value by 2 each day' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 8
    end
  end

  context 'value = 0' do
    bread = Item.new('Bread', 1, 0)
    let(:items) { [bread] }
  
    it 'should never have a value less than 0' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
