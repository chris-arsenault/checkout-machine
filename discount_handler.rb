class DiscountHandler
  DISCOUNTS = [
    {name: 'Chips', discount: lambda do |total| 200 * (total/3).floor end },
    {name: 'Salsa', discount: lambda do |total| total * 50 end}
  ]
  def initialize
  end

  def total(checkout_machine)
    return 0 unless checkout_machine.bonus_card_scanned
    @checkout_machine = checkout_machine
    0 - DISCOUNTS.map { |d| discount_for_item(d) }.reduce(0, :+)
  end

  private

  def discount_for_item(discount)
    discount[:discount].call(num_items(discount[:name]))
  end

  def num_items(name)
    @checkout_machine.items.count{|item| item.name == name}
  end
end