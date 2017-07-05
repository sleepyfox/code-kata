should = require('chai').should()
Checkout = require './checkout'

COFFEE =
  code: 'IEB'
  price: 650

HOBNOBS =
  code: 'MOH'
  price: 169

EGGS =
  code: 'EQE'
  price: 270
  
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
    .should.equal -169
    

describe 'A checkout after scanning', ->
  describe 'a packaet of hobnobs and a coffee', ->
    checkout = Checkout.new()
    it 'should total £8.19', ->
      checkout
      .scan HOBNOBS
      .scan COFFEE
      .total()
      .should.equal 819
      
  describe 'two packets of hobnobs', ->
    checkout = Checkout.new()
    it 'should total £1.69', ->
      checkout
      .scan HOBNOBS
      .scan HOBNOBS
      .total()
      .should.equal 169

  describe 'three hobnobs, one eggs and one coffee', ->
    checkout = Checkout.new()
    it 'should total £12.58', ->
      checkout
      .scan HOBNOBS
      .scan EGGS
      .scan HOBNOBS
      .scan HOBNOBS
      .scan COFFEE
      .total()
      .should.equal 1258
      
### Integration tests
Basket contents: EQE, EQE, MOH, EQE 
Total price expected: £8.29
###
