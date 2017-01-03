class ScannedItems
  def initialize()
    @items = []
  end

  def total()
    @items.map(&:cost).reduce(0, :+)
  end

  def add(sku)
    @items << Item.new(sku: sku)
  end

  def num_chips
    @items.count(&:chips?)
  end

  def num_salsa
    @items.count(&:salsa?)
  end
end