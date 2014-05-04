#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @createNewGame()

  createNewGame: ->
    @set 'playerWinMsg', 'Player Wins!'
    @set 'dealerWinMsg', 'Dealer Wins!'
    @set 'drawMsg', 'Draw'

    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @get('playerHand').on('stand', @stand, @)
    @get('playerHand').on('bust', @bust, @)

    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on('win', @win, @)

    @set 'gameOver', false

  stand: ->
    @get('dealerHand').at(0).flip()

    while !@get('gameOver')
      @get('dealerHand').hit()

  win: ->
    playerScore = @get('playerHand').scores()[0]
    dealerScore = @get('dealerHand').scores()[0]

    if dealerScore > playerScore and dealerScore <= 21
      @set 'winner', @get 'dealerWinMsg'
      @set 'gameOver', true

    if dealerScore > 21
      @set 'winner', @get 'playerWinMsg'
      @set 'gameOver', true

    if dealerScore >= 17
      if dealerScore > playerScore
        @set 'winner', @get 'dealerWinMsg'
      else if dealerScore is playerScore
        @set 'winner', @get 'drawWinMsg'
      else
        @set 'winner', @get 'playerWinMsg'

      @set 'gameOver', true

  bust: ->
    playerScore = @get('playerHand').scores()[0]

    if playerScore > 21
      @set 'winner', @get 'dealerWinMsg'
      @set 'gameOver', true
