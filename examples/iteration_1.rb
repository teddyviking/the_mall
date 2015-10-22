require_relative("../lib/the_mall.rb")


stock = [TheMall::Item.new("Fish", 10), TheMall::Item.new("Meat", 20), TheMall::Fruit.new("Orange", 2), TheMall::Houseware.new("Vacuum", 150)]
metropolis = TheMall::Shop.new("Metropolis")
metropolis.add_items_to_stock(stock)
metropolis.recieve_new_visit