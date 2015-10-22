module TheMall
  class ShoppingCart
    attr_reader :items

    def initialize
      @items = []
    end

    def add_item_to_cart(item, quantity)
      quantity.times {|quantity| @items << item}
      puts "Added #{quantity} #{item.name} to the cart!"
    end

    def checkout
      total_price = @items.reduce(0) {|total, item| total + item.apply_discount}
      total_price = apply_general_discount(total_price)
      puts "It's #{total_price}€. Thanks for your purchase :)!"
    end

    private

    def apply_general_discount(total_price)
      @items.count > 5 ? (total_price - (total_price / 10)) : total_price
    end
  end
end