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

  def num_items(name)
    @items.count{|item| item.name == name}
  end
end