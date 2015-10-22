module TheMall

  class Shop

    def initialize(name)
      @name = name
      @stock = []
    end

    def add_items_to_stock(items)
      items.each {|item| @stock << item}
    end

    def receive_new_visit
      @shopping_cart = ShoppingCart.new
      puts "Welcome to #{@name}"
      display_stock
      ask_wanna_buy
      proceed_to_checkout
    end

    def display_stock
      puts "Today you can find the following products:"
      @stock.each{|item| puts "#{item.name}: #{item.price}€"}
    end

    private

    def ask_wanna_buy
      item = ask_for_item
      quantity = ask_for_quantity
      @shopping_cart.add_item_to_cart(item, quantity)
      ask_wanna_buy unless checkout?
    end
    
    def ask_for_item
      puts "What do you want to add to your cart?"
      user_input = gets.chomp
      get_item_from_stock(user_input)
    end

    def ask_for_quantity
      puts "How many do you want?"
      gets.chomp.to_i
    end

    def get_item_from_stock(item_name)
      @stock.find{|item| item.name == item_name}
    end

    def checkout?
      puts "Do you want to proceed to checkout? Y/N"
      user_input = gets.chomp
      user_input == "Y" ? true : false
    end

    def proceed_to_checkout
      @shopping_cart.checkout
      @shopping_cart.items.each do |item|
        @stock.delete_at(@stock.index(item) || @stock.length)      
      end
    end

  end

end