class TotalHandler
  def initialize
  end

  def total(checkout_machine)
    checkout_machine.items.map(&:cost).reduce(0, :+)
  end
end