# Exposes
# initialize
# void add(int)
# array<item> all()

# depends on
# Buyable.new
# Buyable.buyable?

class BuyableScanner
  def initialize
    @items = []
  end

  def add(sku)
    @items << Buyable.new(sku: sku) if Buyable.buyable?(sku)
  end

  def all
    @items
  end
end