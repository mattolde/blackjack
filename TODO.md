# TODO
- User require.js

- allow player to select between the ACE + 10 or 1
- Update design
- create unit test

# COMPLETED
- Create new game
- switch to mustache for templating
- place templates into html

## NOTES

- The scores are an array of potential scores.
- Usually, that array contains one element. That is the only score.
- when there is an ace, it offers you two scores - the original score, and score + 10.

## MODELS

App Model
  - deck : Deck:Collection
  - playerHand : 
  - dealerHand

Card Model
  revealed: boolean
  value
  suitName
  rankName
  - flip FUNCTION
    toggles revealed


## COLLECTIONS

Deck Collection
  model : Card
  FUNCTIONS
  - initialize
    -add
      creates 52 shuffled cards
  - dealPlayer
    Create instance of Hand for player with two cards
  - dealDealer
    Create instance of Hand for dealer with two cards
    Dealers first card is flipped

Hand Colleciton
  model : Card
  - hit FUNCTION
    takes and removes a card from the deck and adds it to the hand.

## VIEWS

AppView
  EVENTS
    click hit
      calls playerHand hit()
    click stand
      calls playerHand stand()

CardView
  render
    add class covered unless revealed === true

HandView
  render
    creates cardview for each card and displays score
  



