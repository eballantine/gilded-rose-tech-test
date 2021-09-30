require 'gilded_rose'

describe 'Backstage Pass' do

  context 'sell_in > 10' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 20, 10)
    let(:items) { [backstage] }

    it 'should increase in quality by 1' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 11
    end
  end

  context 'sell_in <= 10 and > 5' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 9, 10)
    let(:items) { [backstage] }

    it 'should increase in quality by 2' do 
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 12
    end
  end
  
  context 'sell_in <= 5' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 4, 10)
    let(:items) { [backstage] }

    it 'should increase in quality by 3' do
      gilded_rose = GildedRose.new(items) 
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 13
    end
  end

  context 'sell_in is 0' do
    backstage = Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)
    let(:items) { [backstage] }
    
    it 'should have a quality value of 0' do
      gilded_rose = GildedRose.new(items)
      gilded_rose.update_quality()
      expect(items[0].quality).to eq 0
    end
  end
end
