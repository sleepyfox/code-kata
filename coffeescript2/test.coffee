should = require('chai').should()
Checkout = require './checkout.coffee'

COFFEE =
  code: 'IEB'
  price: 650

HOBNOBS =
  code: 'MOH'
  price: 169
  
describe 'A checkout, when no items have been scanned', ->
  checkout = Checkout.new()
  it 'should have a total of zero', ->
    checkout.total().should.equal 0

  it 'should be able to scan an item', ->
    checkout.scan(COFFEE).total().should.equal 650

  it 'should be able to recognise a BOGOF', ->
    checkout
    .scan HOBNOBS
    .scan HOBNOBS
    .bogof()
    .should.equal 169
    

describe 'A checkout after scanning', ->
  describe 'a packaet of hobnobs and a coffee', ->
    checkout = Checkout.new()
    it 'should total £8.19', ->
      checkout
      .scan HOBNOBS
      .scan COFFEE
      .total()
      .should.equal 819
      
  describe.skip 'two packets of hobnobs', ->
    checkout = Checkout.new()
    it 'should total £1.69', ->
      checkout
      .scan HOBNOBS
      .scan HOBNOBS
      .total()
      .should.equal 169

### Integration tests
Basket contents: MOH, EQE, MOH, MOH, IEB
Total price expected: £12.58

Basket contents: EQE, EQE, MOH, EQE 
Total price expected: £8.29
###
