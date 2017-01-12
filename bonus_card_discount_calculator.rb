# Exposes
# initialize
# decimal total(array<item>)

# depends on
# BonusCard.bonus_level
# Buyable.name


class BonusCardDiscountCalculator
  BONUS_CARD_DISCOUNTS = [
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
    BONUS_CARD_DISCOUNTS.map { |d| discount_for_item(d) }.reduce(0, :+)
  end

  def bonus_card_level
    return 0 unless @items.any? {|i| i.respond_to?(:bonus_level)}
    bonus_card = @items.select{|i| i.respond_to?(:bonus_level)}.first
    bonus_card.bonus_level
  end

  def discount_for_item(discount)
    discount[:discount].call(num_items(discount[:name])) * bonus_card_level
  end

  def num_items(name)
    @items.count{|item| item.name == name}
  end
end