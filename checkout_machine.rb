Dir['./*.rb'].each {|file| require file }

class CheckoutMachine
  def initialize
    @bonus_card_scanned = false
    @items = ScannedItems.new
  end

  def scan(sku)
    if sku == 000
      @bonus_card_scanned = true
    else
      add_item(sku)
    end
  end

  def total
    items_total - discount_amount
  end

  private

  def discount_amount
    return 0 unless @bonus_card_scanned
    discounter = Discounter.new(@items)
    discounter.discount
  end

  def add_item(sku)
    @items.add(sku)
  end

  def items_total
    @items.total
  end
end
