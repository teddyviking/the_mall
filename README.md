# The Mall

If you remember, in the prework we did a pretty simple shopping cart. It's a great start for beginners.  But after all the Object Oriented and Single Responsibility stuff, now we know how to make things grow. We have been talking with other shop owners, and we think it's time to join our forces and take our old little shop and transform it into the brand new shopping mall in town.

## The refactor

Unless you knew about Object Oriented programming and SOLID principles before doing the prework, probably your previous shopping cart is not ready to become our dream mall.

Let's recap the specifications. 

Initial classes:

* `ShoppingCart`
  * Stores customer's items in the shopping cart.
  * Is able to add new items to the customer's shopping cart.
  * Performs the checkout procedure by calculating the total price, taking into consideration any discount.
* `Item`
  * Holds the price and the discount of each item.
  * Could have child classes for special Items with different discounts.

About discounts: 

* By default, items will have no discount.
* Fruits have no discount during weekdays but on weekends they have a 10% discount.
* Housewares have no discount unless their unit price is more than 100€ / $100. If the price is greater than 100€ / $100, there will be a 5% discount.
* If there are more than 5 items in the cart, the user gets 10% off

Now, you should make sure that every method is in the appropriate class. Also, minimize the dependencies to the least possible so we can easily escalate our code later.

Before continuing, ask your TA to take a look at your code to make sure that your little shopping cart is ready to go.

## The shop's stock

We are creating a mall, aren't we? That means that we are going to have multiple shops, each of them having it's own stock.

Obviously, in each shop the number of items in stock will decrease after each payment.

Think that it should be easy to work with the stocks from outside it. How is it going to be related to the Shopping Cart? Indeed, it should have 3 main actions:

* Show the items available in the shop
* Add new items to the shop's stock
* Decrease the number of items in stock after a payment transaction takes place.

Probably you will realize that you have to change things from the ShoppingCart class, but if you have created its methods correctly, with one responsibility for each of them, there shouldn't be a lot.

## The Warehouse

Wait. We might have a little problem. What would happen if we're running out of stock!? We should have an automatic process to ensure we always have items to sell.

So, we need a method that checks if the stock of an item is low and triggers an order to the supplying warehouse to get more products and update our stock. Sadly, the stuff in the warehouse isn't for free. We will have to pay for it. To do that, we have to keep the financial balance of the shop somewhere...

Yes. We have to create a new class and make some changes to previous classes and methods. Keep always in mind that we want to separate concerns as much as possible.

## The People and the Mall

While you were making arregements with the warehouse manager to supply your shop, we have found other people interested in joining us in our Mall adventure. We have several shops, investors, the space is ready... It's time to make the great opening!

We need to gather all the shops together and offer an information panel to the customers when they enter the mall. Through this panel, they'll be able to choose which shop they want to visit in a certain moment.

It could be something as simple as:

```
1. Name of the shop - What it sells
2. Name of the shop - What it sells
...
```

Also, because we want to make sure that the mall is a success, we want to count the number of visits we are having in general and for each shop. These statistics will be enough for now (but who knows in the future...)

## Benefits Report

The investors are a bit nervous because they want to see results, so we are going to generate a brief document for each shop where we will reflect the following data:

* Number of visits to the shop
* Number of purchases
* Cost of supplies
* Total income
* Total benefits

It should be a `txt` file that we can send to them.


## Competition - Black Friday discount

The Mall is a success and more shops are opening. But something we didn't expect was that several shops selling the same kind of items are joining the mall. And our guess is that they might do unfair competition...

Some of the shops are offering Black Friday discounts (and there is a lot of time left before Black Friday!!). So our software should reflect this grim reality, allowing shops to have their unfair discounts. 

## Advertisement

Those bastards of the Black Friday discount now want to add some ads of their products above the intro panel. We have talked with the owners of the other shops and we have agreed to create a bidding system to select which shop's advertisements will be shown.

It should take in consideration the following rules:
* There will be only two advertisement positions: one above the information panel and one below it.
* When you want to add and ad, you have to select the position, how much do you want to pay for impression and how many impressions are you willing to pay for.
* Each time a new visitor arrives, the system will select the ads with the higher bid and will reduce the number of impressions left.

This money paid should be reflected also in the expenses of the shop.

## Broken shops

This ruthless competition between shops means war. And by war we mean that some shops will definitely go bankrupt. If a shop goes bankrupt afer a bad management of warehouse supplys and advertisement, it will close and it's place will be available for new investors.

Welcome to the jungle, my friend.
