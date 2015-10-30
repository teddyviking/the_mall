require_relative("../lib/the_mall.rb")

warehouse = TheMall::Warehouse.new

initial_stock = []
2.times{|n| initial_stock << TheMall::Item.new("Fish", 10) << TheMall::Item.new("Meat", 20) << TheMall::Fruit.new("Orange", 2) << TheMall::Houseware.new("Vacuum", 150)}
metropolis = TheMall::Shop.new("Metropolis", 2000, warehouse, TheMall::ShoppingCart)
metropolis.add_items_to_stock(initial_stock)

metropolis.receive_new_visit
metropolis.display_stock