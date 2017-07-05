# Shopping basket kata
You have been hired to build a EPOS (Electronic Point Of Sale) System for a
small supermarket. 

```
Product code | Name                      | Price
------------------------------------------------
EQE          | Essential Quail's Eggs    | £2.70
MOH          | McVities Original Hobnobs | £1.69
IEB          | Illy expresso beans 250g  | £6.50
```
The new self-service checkouts scan items from the basket. The interface to 
the checkout looks something like this: (shown in JavaScript)
```
checkout = new Checkout(offers)
checkout.scan(item)
checkout.scan(item)
price = checkout.total()
```

In order to promote more sales we'd like to make the following offers:
* Hobnobs - buy one, get one free
* Quail's Eggs - Buy three or more and get 50p off each one

Obviously we'd like to change offers regularly in order to keep attracting
new customers, so the code should be flexible. 

Build a system that incorporates these features.

We have provided the following test cases in order to help prove the 
correct functioning of the system:

# Test cases
```
Basket contents: MOH, EQE, MOH, MOH, IEB
Total price expected: £12.58

Basket contents: MOH, MOH
Total price expected: £1.69

Basket contents: EQE, EQE, MOH, EQE 
Total price expected: £8.29
```

# Desirable enhancements
If you have time, please consider how the system may be extended to include:
* Discounts that are easily reconfigured 
  e.g. buy two (intead of one) and get one free
* Rules that apply to the entire basket
  e.g. Save one pound on sales of fifteen pounds or more
* Can items play a part in multiple discounts?
* If yes, what happens when an item could take part in two different offers?
  e.g. three for two, and buy three get 50p off on the same item
* How would your solution work with deals that cross products?
  e.g. sandwich, snack and drink for five pounds
