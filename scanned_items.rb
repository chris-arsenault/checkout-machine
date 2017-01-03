class ScannedItems
  def initialize
    @items = []
  end

  def add(sku)
    @items << Item.new(sku: sku)
  end

  def total
    @items.map(&:cost).reduce(0, :+)
  end
  
  def discount
    @items.uniq(&:sku)
      .map{|i| {item: i, count: @items.count{|item| item.sku == i.sku}}}
      .map{|hash| hash[:item].discount(hash[:count])}
      .reduce(0, :+)
  end
end