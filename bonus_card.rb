class BonusCard
  BONUS_CARD_MAX_SKU = 99
  BONUS_CARD_GOLD_LEVEL = 50

  BONUS_CARDS = [
    {name: 'Bonus Card', bonus_level: 1, skus: (0..(BONUS_CARD_GOLD_LEVEL - 1))},
    {name: 'Gold Bonus Card', bonus_level: 1.5, skus: (BONUS_CARD_GOLD_LEVEL..BONUS_CARD_MAX_SKU)}
  ]

  attr_accessor :sku, :cost, :name, :bonus_level

  def initialize(sku:, name: nil, bonus_level: nil)
    card = BONUS_CARDS.select{|i| i[:skus].include?(sku)}.first
    @sku = sku
    @cost = 0
    @name = name || card[:name]
    @bonus_level = bonus_level || card[:bonus_level]
  end

  def self.bonus_card?(sku)
    sku <= BONUS_CARD_MAX_SKU
  end
end