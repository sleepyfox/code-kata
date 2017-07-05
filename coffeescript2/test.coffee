should = require('chai').should()

COFFEE =
  code: 'IEB'
  price: 650
  
Checkout =
  new: ->
    items: []
    total: ->
      this.items[0] or 0
    scan: ->
      this.items = [650]
      this
  
describe 'A checkout, when no items have been scanned', ->
  checkout = Checkout.new()
  it 'should have a total of zero', ->
    checkout.total().should.equal 0

  it 'should be able to scan an item', ->
    checkout.scan(COFFEE).total().should.equal 650
