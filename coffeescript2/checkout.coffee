module.exports =
  new: ->
    items: []
    scan: (x) ->
      @items.push(x) # slightly :-/ because mutable state
      @ # return this for fluent API
    bogof: ->
      count_offer_items = @items
                          .filter (x) -> x.code is 'MOH'
                          .length
      discount = 169 * Math.floor(count_offer_items / 2)
    total: ->
      @items.push
        code: 'BOGOF'
        price: @bogof()
      sum = (acc, x) -> acc + x.price
      @items.reduce sum, 0
