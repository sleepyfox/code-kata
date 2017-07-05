should = require('chai').should()

Checkout =
  new: ->
    total: -> 0
  
describe 'A checkout, when no items have been scanned', ->
  checkout = Checkout.new()
  it 'should have a total of zero', ->
    checkout.total().should.equal 0
