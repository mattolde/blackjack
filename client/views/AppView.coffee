class window.AppView extends Backbone.View

  template: _.template '
    <% if(gameOver){ %>
    
    <button class="new-game-button">New Game</button>

      <% if(winner === "player"){ %>
        <h1>WINNING!!!</h1>
      <% }else if(winner === "dealer"){ %>
        <h1>Dealer Wins</h1>
      <% }else{ %>
        <h1>Draw</h1>
      <% } %>  

    <% }else{ %>

    <button class="hit-button">Hit</button> 
    <button class="stand-button">Stand</button>    
    
    <% } %>      

    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>    
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": -> @model.get('playerHand').stand()

  initialize: ->
    @model.on('change:gameOver', @render, @)
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template({
      gameOver: @model.get('gameOver'),
      winner: @model.get('winner')
      })
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
