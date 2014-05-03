class window.AppView extends Backbone.View

  template: $('#game-template').html()

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()
    "click .new-game-button": -> @model.createNewGame()

  initialize: ->
    @model.on('change:gameOver', @render, @)
    @model.on('change:deck', @render, @)
    @render()

  render: ->
    @$el.children().detach()

    @$el.html Mustache.to_html @template, @model.attributes

    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
