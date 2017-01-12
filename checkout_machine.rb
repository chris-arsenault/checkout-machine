Dir['./*.rb'].each {|file| require file }

# Exposes
# initialize
# void scan(int)
# float total()

# depends on
# ScanHandler.scan
# ScanHandler.all
# TotalHandler.total

class CheckoutMachine
  def initialize
    @scan_handlers = []
    @total_handlers = []

    # is there a better way to do this?
    # startup config of some kind?
    register_scan_handler(BuyableScanner.new)
    register_scan_handler(BonusCardScanner.new)
    register_total_handler(TotalCalculator.new)
    register_total_handler(DiscountCalculator.new)
  end

  def scan(sku)
    @scan_handlers.each { |h| h.add(sku) }
  end

  def total
    @total_handlers.map{ |h| h.total(all_items) }.reduce(0, :+)
  end

  private
  def all_items
    @scan_handlers.map(&:all).reduce([], :+)
  end

  def register_scan_handler(handler)
    @scan_handlers << handler
  end

  def register_total_handler(handler)
    @total_handlers << handler
  end
end
