should = require('chai').should()

COFFEE =
  code: 'IEB'
  price: 650

HOBNOBS =
  code: 'MOH'
  price: 169
  
Checkout =
  new: ->
    items: []
    scan: (x) ->
      @items.push(x)
      @ # for fluent API
    total: ->
      sum = (acc, x) -> acc + x.price
      @items.reduce sum, 0
  
describe 'A checkout, when no items have been scanned', ->
  checkout = Checkout.new()
  it 'should have a total of zero', ->
    checkout.total().should.equal 0

  it 'should be able to scan an item', ->
    checkout.scan(COFFEE).total().should.equal 650

describe 'A checkout after scanning', ->
  describe 'a packaet of hobnobs and a coffee', ->
    checkout = Checkout.new()
    it 'should total £8.19', ->
      checkout
      .scan(HOBNOBS)
      .scan(COFFEE)
      .total()
      .should.equal 819
      

###
Basket contents: MOH, EQE, MOH, MOH, IEB
Total price expected: £12.58

Basket contents: MOH, MOH
Total price expected: £1.69

Basket contents: EQE, EQE, MOH, EQE 
Total price expected: £8.29
###
