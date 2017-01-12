# Exposes
# initialize
# decimal total(array<item>)

# depends on
# Item.cost

class TotalHandler
  def initialize
  end

  def total(items)
    items.map(&:cost).reduce(0, :+)
  end
end