# Imports
should = require('chai').should()
Checkout = require './checkout'

# Constants
COFFEE =
  code: 'IEB'
  price: 650

HOBNOBS =
  code: 'MOH'
  price: 169

EGGS =
  code: 'EQE'
  price: 270

# Checkout unit tests
describe 'A checkout, when no items have been scanned', ->
  it 'should have a total of zero', ->
    Checkout.new()
    .total()
    .should.equal 0

  it 'should be able to scan an item', ->
    Checkout.new()
    .scan(COFFEE)
    .total()
    .should.equal 650

  it 'should recognise a BOGOF', ->
    Checkout.new()
    .scan HOBNOBS
    .scan HOBNOBS
    .bogof()
    .should.equal -169

  it 'should recognise a bulk discount', ->
    Checkout.new()
    .scan EGGS
    .scan EGGS
    .scan EGGS
    .bulk_discount()
    .should.equal -150

# Integration tests
describe 'A checkout after scanning', ->
  describe 'a packet of hobnobs and a coffee', ->
    it 'should total £8.19', ->
      Checkout.new()
      .scan HOBNOBS
      .scan COFFEE
      .total()
      .should.equal 819
      
  describe 'two packets of hobnobs', ->
    it 'should total £1.69', ->
      Checkout.new()
      .scan HOBNOBS
      .scan HOBNOBS
      .total()
      .should.equal 169

  describe 'three hobnobs, one eggs and one coffee', ->
    it 'should total £12.58', ->
      Checkout.new()
      .scan HOBNOBS
      .scan EGGS
      .scan HOBNOBS
      .scan HOBNOBS
      .scan COFFEE
      .total()
      .should.equal 1258

  describe 'three eggs and a packet of hobnobs', ->
    it 'should total £8.29', ->
      Checkout.new()
      .scan EGGS
      .scan EGGS
      .scan HOBNOBS
      .scan EGGS
      .total()
      .should.equal 829
