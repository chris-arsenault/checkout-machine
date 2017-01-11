class Discounter
  DISCOUNTS = [
    {name: 'Chips', discount: lambda do |total| 200 * (total/3).floor end },
    {name: 'Salsa', discount: lambda do |total| total * 50 end}
  ]
  def initialize(scanned_items)
    @scanned_items = scanned_items
  end

  def discount
    DISCOUNTS.map { |d| discount_for_item(d) }.reduce(0, :+)
  end

  private

  def discount_for_item(discount)
    num_items = @scanned_items.num_items(discount[:name])
    discount[:discount].call(num_items)
  end
end