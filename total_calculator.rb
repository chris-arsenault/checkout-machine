# Exposes
# initialize
# decimal total(array<item>)

# depends on
# Buyable.cost

class TotalCalculator
  def initialize
  end

  def total(items)
    items.map(&:cost).reduce(0, :+)
  end
end