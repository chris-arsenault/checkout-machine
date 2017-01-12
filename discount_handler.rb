# Exposes
# initialize
# decimal total(array<item>)

# depends on
# Item.new
# Item.bonus_card?
# Item.name


class DiscountHandler
  DISCOUNTS = [
    {name: 'Chips', discount: lambda do |total| 200 * (total/3).floor end },
    {name: 'Salsa', discount: lambda do |total| total * 50 end}
  ]
  def initialize
  end

  def total(items)
    @items = items
    return 0 unless has_bonus_card
    0 - total_discount
  end

  private

  def total_discount
    DISCOUNTS.map { |d| discount_for_item(d) }.reduce(0, :+)
  end

  def has_bonus_card
    @items.any?(&:bonus_card?)
  end

  def discount_for_item(discount)
    discount[:discount].call(num_items(discount[:name]))
  end

  def num_items(name)
    @items.count{|item| item.name == name}
  end
end