module TheMall

  class Shop

    def initialize(name, initial_budget, warehouse, cart_class)
      @name = name
      @budget = initial_budget
      @warehouse = warehouse
      @cart_class = cart_class
      @stock = []
    end

    def add_items_to_stock(items)
        items.each {|item| @stock << item}
    end

    def receive_new_visit
      @shopping_cart = @cart_class.new
      puts "Welcome to #{@name}"
      display_stock
      ask_wanna_buy
      proceed_to_checkout
      binding.pry
    end

    def display_stock
      puts "Today you can find the following products:"
      phrases = @stock.map{|item| "#{item.name}: #{item.price}€"}
      phrases.uniq.each{|phrase| puts phrase}
    end

    def get_quantity_of_item(item)
      @stock.count {|stock_item| stock_item.genre == item.genre }
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
      update_stock_after_checkout
      destroy_shopping_cart
    end

    def update_stock_after_checkout
      @shopping_cart.items.each do |item|
        stock_item = @stock.find {|stock_item| stock_item.genre == item.genre}
        @stock.delete_at(@stock.index(stock_item)) if stock_item
        order_item(item) if low_item_stock?(item)      
      end
    end

    def destroy_shopping_cart
      @shopping_cart = nil
    end

    def low_item_stock?(item)
      item_stock = get_quantity_of_item(item)
      item_stock > 0 ? false : true
    end

    def order_item(item)
      receipt = @warehouse.process_order(item.genre, self)
      @budget -= receipt
    end

  end

end