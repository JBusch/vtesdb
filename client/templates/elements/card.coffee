Template.card.helpers
  inventoryCount: ->
    card = Inventories.findOne(cardId: @cardId)
    if card?
      return card.count
    else
      return 0

  isCryptCard: ->
    return @cardType == 'crypt'

  rulings: ->
    rulings = Rulings.findOne(id: @cardId)
    return rulings?.rulings

Template.card.onRendered ->
  $('.special.card .image').dimmer(on: 'hover')
  $('.inventory-button').popup(inline: true, on: 'click')
  $('.rulings-icon').popup(inline: true, on: 'hover')

Template.card.events
  'submit .set-inv': (event) ->
    id = event.target.id.value
    count = parseInt(event.target.count.value)
    Meteor.call 'setInv', id, count
    $('.inventory-button').popup 'hide all'
    return false

  'click .inventory-button': (event) ->
    $('.badge-input').focus()