# Exposes
# initialize
# decimal total(array<item>)

# depends on
# Item.new
# Item.bonus_card?
# Item.name
# Item.BONUS_CARD_SKUS
# ITem.BONUS_CARD_SKU_MAX


class DiscountCalculator
  DISCOUNTS = [
    {name: 'Chips', discount: lambda do |total| 200 * (total/3).floor end },
    {name: 'Salsa', discount: lambda do |total| total * 50 end}
  ]
  def initialize
  end

  def total(items)
    @items = items
    0 - total_discount
  end

  private

  def total_discount
    DISCOUNTS.map { |d| discount_for_item(d) }.reduce(0, :+)
  end

  def num_items(name)
    @items.count{|item| item.name == name}
  end

  def bonus_card_level
    return 0 unless @items.any?(&:bonus_card?)
    bonus_card = @items.select(&:bonus_card?).first
    case bonus_card.sku
      when 0..Item::BONUS_CARD_MAX_SKU / 2
        1
      when (Item::BONUS_CARD_MAX_SKU / 2)..Item::BONUS_CARD_MAX_SKU
        1.5
      else
        0
    end
  end

  def discount_for_item(discount)
    discount[:discount].call(num_items(discount[:name])) * bonus_card_level
  end
end