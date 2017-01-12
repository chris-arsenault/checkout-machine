# Exposes
# initialize
# void add(int)
# array<item> all()

# depends on
# BonusCard.new
# BonusCard.bonus_card?

class BonusCardScanner
  def initialize
    @items = []
  end

  def add(sku)
    @items << BonusCard.new(sku: sku) if BonusCard.bonus_card?(sku)
  end

  def all
    return [] if @items.empty?
    [@items.sort_by(&:sku).reverse.first]
  end
end