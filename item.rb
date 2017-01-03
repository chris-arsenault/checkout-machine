class Item

  ITEMS = [
    {sku: 123, cost: 200, name: 'Chips', discount: lambda do |total| 200 * (total/3).floor end},
    {sku: 456, cost: 100, name: 'Salsa', discount: lambda do |total| total * 50 end},
    {sku: 789, cost: 1000, name: 'Wine'},
    {sku: 111, cost: 550, name: 'Cigarettes'}
  ]

  attr_accessor :sku, :cost, :name

  def initialize(sku:, cost: nil, name: nil)
    item = ITEMS.select{|i| i[:sku] == sku}.first
    @sku = sku || item[:sku]
    @cost = cost || item[:cost]
    @name = name || item[:name]
    @discount = nil ||item[:discount]
  end

  def discount(total)
    return 0 unless @discount

    @discount.(total)
  end
end