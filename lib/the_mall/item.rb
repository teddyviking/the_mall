module TheMall
  class Item
    attr_reader :name, :price

    def initialize(name, price)
      @name = name
      @price = price
    end

    def apply_discount
      @price
    end

    def set_selling_price(selling_price)
      @price = selling_price
    end

    def genre
      @name.downcase.to_sym
    end

  end
  class Houseware < Item

    def apply_discount     
      @price >= 100 ? (@price - @price / 20) : @price
    end
        
  end

  class Fruit < Item

    def apply_discount
      today = Date.today
      (today.saturday? || today.sunday?) ? (@price - @price / 10) : @price
    end
  end
end