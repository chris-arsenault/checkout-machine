# Exposes
# initialize
# void add(int)
# array<item> all()

# depends on
# Item.new
# Item.BONUS_CARD_SKUS

class ScanHandler
  def initialize
    @items = []
  end

  def add(sku)
    @items << Item.new(sku: sku) unless Item::BONUS_CARD_SKUS.include?(sku)
  end

  def all
    @items
  end
end