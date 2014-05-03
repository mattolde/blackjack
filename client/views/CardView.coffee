class window.CardView extends Backbone.View

  className: 'card'

  template: $('#card-template').html()

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html

    @$el.html Mustache.to_html @template, @model.attributes
    
    @$el.addClass 'covered' unless @model.get 'revealed'
