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
    register_scan_handler(ScanHandler.new)
    register_scan_handler(BonusCardHandler.new)
    register_total_handler(TotalHandler.new)
    register_total_handler(DiscountHandler.new)
  end

  def scan(sku)
    scan_item(sku)
  end

  def total
    combine_items
    calculate_totals
  end

  private
  def combine_items
    @items = all_items
  end

  def all_items
    @scan_handlers.map(&:all).reduce([], :+)
  end

  def scan_item(sku)
    @scan_handlers.each { |h| h.add(sku) }
  end

  def calculate_totals
    @total_handlers.map{ |h| h.total(@items) }.reduce(0, :+)
  end

  def register_scan_handler(handler)
    @scan_handlers << handler
  end

  def register_total_handler(handler)
    @total_handlers << handler
  end
end
