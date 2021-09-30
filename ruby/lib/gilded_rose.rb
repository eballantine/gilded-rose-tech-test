class GildedRose
  def initialize(items)
    @items = items
  end

  def update_item_stats
    @items.each do |item|
      decrease_sell_in(item)
      update_quality(item)
    end 
  end

  private

  def update_quality(item)
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        increase_quality(item)
      else
        decrease_quality(item) 
      end 
    sell_in_passed(item) if item.sell_in < 0 
  end

  def sell_in_passed(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      item.quality = 0 
    elsif item.name == "Aged Brie" 
      increase_quality(item)
    elsif item.name != "Sulfuras, Hand of Ragnaros"
      decrease_quality(item)
    end
  end

  def backstage_quality(item)
    item.quality += 1 if item.quality < 50 
    item.quality += 1 if item.sell_in < 11 && item.quality < 50 
    item.quality += 1 if item.sell_in < 6 && item.quality < 50 
  end

  def increase_quality(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      backstage_quality(item)
    else
      item.quality += 1 unless item.quality == 50 
    end
  end

  def decrease_quality(item)
    item.quality -= 1 unless item.quality == 0 || item.name == "Sulfuras, Hand of Ragnaros"
    item.quality -= 1 if item.name == 'Conjured' 
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end
