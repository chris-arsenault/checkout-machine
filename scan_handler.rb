class ScanHandler
  def initialize
    @items = []
  end

  def add(sku)
    @items << Item.new(sku: sku)
  end

  def all
    @items
  end
end