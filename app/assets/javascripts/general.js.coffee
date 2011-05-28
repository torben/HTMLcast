jQuery ->
  # color changer
  colors =
    values: ['red', 'blue', '#d9cb9e', '#d1e503'],
    pos: -1,

    next: ->
      values = @values
      @pos++
      @pos = 0 if @pos >= values.length
      values[@pos]

  animate = ->
      $("body").animate({
        backgroundColor: colors.next()
      }, 15000, -> window.setTimeout((-> animate()), 1000))

  animate()