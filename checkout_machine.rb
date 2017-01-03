Dir['./*.rb'].each {|file| require file }

class CheckoutMachine
  def initialize
    @balance = 0
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
    @bonus_card_scanned ? salsa_discount + chips_discount : 0
  end

  def add_item(sku)
    @items.add(sku)
  end

  def items_total
    @items.total
  end

  def salsa_discount
    50 * @items.num_salsa
  end

  def chips_discount
    200 * (@items.num_chips/3).floor
  end
end
