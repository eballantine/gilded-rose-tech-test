class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      update_sell_in(item)
      update_value(item)
    end 
  end

  private

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end

  def update_value(item)
    if item.quality < 50
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        item.quality += 1
        backstage_bonus(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
      else
        item.quality -= 1 if item.quality > 0 
      end
    end 
    sell_in_passed(item) if item.sell_in < 0 
  end

  def sell_in_passed(item)
    if item.name == "Backstage passes to a TAFKAL80ETC concert"
      item.quality = 0 
    elsif item.name == "Aged Brie" && item.quality < 50
      item.quality += 1
    elsif item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
      item.quality -= 1
    end
  end

  def backstage_bonus(item)
    if item.sell_in < 11 && item.quality < 50
      item.quality += 1
    end
    if item.sell_in < 6 && item.quality < 50
      item.quality += 1
    end
  end
end
