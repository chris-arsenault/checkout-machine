# Exposes
# initialize
# void add(int)
# array<item> all()

# depends on
# Item.new
# Item.bonus_card?
# Item.sku
# Item.BONUS_CARD_SKUS
# ITem.BONUS_CARD_SKU_MAX

class BonusCardHandler
  def initialize
    @items = []
  end

  def add(sku)
    @items << bonus_card_item(sku) if Item::BONUS_CARD_SKUS.include?(sku)
  end

  def all
    return [] unless @items.any?(&:bonus_card?)
    [@items.sort(&:sku).first()]
  end

  private

  def bonus_card_item(sku)
    name = if sku < Item::BONUS_CARD_MAX_SKU / 2
             'Bonus Card'
           else
             'Premium Bonus Card'
           end
    Item.new(sku: sku, name: name, cost: 0)
  end
end