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
    @items.total - discount_amount
  end

  private

  def add_item(sku)
    @items.add(sku)
  end

  def discount_amount
    discount = 0
    if @bonus_card_scanned
      discount = 50 * @items.num_salsa
      discount += 200 * (@items.num_chips/3).floor
    end
    discount
  end
end
