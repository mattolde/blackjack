class window.HandView extends Backbone.View

  className: 'hand'

  template: $('#hand-template').html()

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()

    @$el.html Mustache.to_html @template, @collection.attributes

    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()[0]

