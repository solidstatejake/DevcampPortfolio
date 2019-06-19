ready = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    $(this).attr 'data-pos', i + 1
    return
  return

ready = ->
  set_positions()
  $('.sortable').sortable()

  $('.sortable').sortable().bind 'sortupdate', (event, ui) ->
    updated_order = []
    set_positions()

    $('.card').each (i) ->
      updated_order.push
        id: $(this).data('id') # Take the id from this card and add it to the updated array
        position: i + 1
      return
    # Gives a direct line of communication with whatever we want to talk to
    $.ajax
      type: 'PUT' # check `rake routes | grep portfolio` to see that 'PUT' verb is for updating
      url: '/portfolios/sort'
      data: order: updated_order
    return

  return

$(document).ready ready