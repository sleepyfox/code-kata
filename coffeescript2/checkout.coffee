module.exports =
  new: ->
    items: []

    scan: (x) ->
      @items.push(x) # slightly :-/ because mutable state
      @ # return this for fluent API

    count: (c) ->
      @items.filter (x) -> x.code is c
            .length

    bogof: ->
      count = @count 'MOH' 
      discount = -169 * Math.floor(count / 2)

    bulk_discount: ->
      count = @count 'EQE'
      if count >= 3 then -50 * count else 0
      
    total: ->
      @items.push
        code: 'BOGOF'
        price: @bogof()
      @items.push
        code: 'BULK'
        price: @bulk_discount()
      sum = (acc, x) -> acc + x.price
      @items.reduce sum, 0
