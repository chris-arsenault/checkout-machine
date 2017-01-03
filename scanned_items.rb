class ScannedItems
  CHIPS_SKU = 123
  SALSA_SKU = 456
  WINE_SKU = 789
  CIGARETTES_SKU = 111


  def initialize()
    @items = {}
  end

  def total()
    num_chips * 200 +
      num_salsa * 100 +
      num_wine * 1000 +
      num_cigarettes * 550
  end

  def add(sku)
    @items[sku] ||= 0
    @items[sku] += 1
  end

  def num_chips
    @items[CHIPS_SKU] || 0
  end

  def num_salsa
    @items[SALSA_SKU] || 0
  end

  def num_wine
    @items[WINE_SKU] || 0
  end

  def num_cigarettes
    @items[CIGARETTES_SKU] || 0
  end
end