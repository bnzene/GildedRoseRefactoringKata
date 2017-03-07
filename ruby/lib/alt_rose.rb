class AltRose

  def initialize(items)
    @items = items
  end

  def update_items
    items.each { |item| item.update_quality,update_sell_in }
  end

  def update_quality
      item.appreciation_value
      item.quality < 50 && item.quality > 0 ? item.quality += item.check_sell_in.@multiple : item.ignore
  end

  def update_sell_in
     @sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'
  end

  def appreciation_value
    if item.name == 'Aged Brie'
      @multiple = 1
    elsif item.name == 'Conjured'
      @multiple = -2
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      item.sell_in < 0 ? update_backstage_passes_specially : item
    elsif item.name != 'Sulfuras, Hand of Ragnaros'
      @multiple = -1
    end
  end

  def check_sell_in
    item.sell_in < 0 && item.name != 'Aged Brie' ? @multiple *= 2 : @multiple
  end

  def update_backstage_passes_specially
    if item.sell_in < 11
      item.sell_in < 6 ? @multiple = 3 : @multiple = 2
    end
  end

  def ignore
    item.quality == item.quality
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
