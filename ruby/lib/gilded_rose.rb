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
      if item.name == 'Conjured' 
        decrease_quality(item)
        decrease_quality(item)
      elsif item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        increase_quality(item)
        backstage_bonus(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
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

  def backstage_bonus(item)
    if item.sell_in < 11 
      increase_quality(item)
    end
    if item.sell_in < 6 
      increase_quality(item)
    end
  end

  def increase_quality(item)
    item.quality += 1 unless item.quality == 50 
  end

  def decrease_quality(item)
    item.quality -= 1 unless item.quality == 0 || item.name == "Sulfuras, Hand of Ragnaros"
  end

  def decrease_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end
