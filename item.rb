class Item
  BONUS_CARD_MAX_SKU = 100
  BONUS_CARD_SKUS = 0..BONUS_CARD_MAX_SKU

  ITEMS = [
    {sku: 123, cost: 200, name: 'Chips'},
    {sku: 456, cost: 100, name: 'Salsa'},
    {sku: 789, cost: 1000, name: 'Wine'},
    {sku: 111, cost: 550, name: 'Cigarettes'}
  ]

  attr_accessor :sku, :cost, :name

  def initialize(sku:, cost: nil, name: nil)
    item = ITEMS.select{|i| i[:sku] == sku}.first
    @sku = sku || item[:sku]
    @cost = cost || item[:cost]
    @name = name || item[:name]
  end

  def bonus_card?
    BONUS_CARD_SKUS.include?(sku)
  end
end