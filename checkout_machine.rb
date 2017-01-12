Dir['./*.rb'].each {|file| require file }

class CheckoutMachine
  attr_reader :items, :bonus_card_scanned

  def initialize
    @bonus_card_scanned = false

    @scan_handlers = []
    @total_handlers = []

    # is there a better way to do this?
    # startup config of some kind?
    register_scan_handler(ScanHandler.new)
    register_total_handler(TotalHandler.new)
    register_total_handler(DiscountHandler.new)
  end

  def scan(sku)
    if sku == 000
      @bonus_card_scanned = true
    else
      scan_item(sku)
    end
  end

  def total
    combine_items
    calculate_totals
  end


  # ScanHandler public interface
  # void add(int)
  # list<item> all()

  # TotalHandler public interface
  # decimal total(checkout_machine)

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
    @total_handlers.map{ |h| h.total(self) }.reduce(0, :+)
  end

  def register_scan_handler(handler)
    @scan_handlers << handler
  end

  def register_total_handler(handler)
    @total_handlers << handler
  end
end
