// Generated by CoffeeScript 1.7.1
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.App = (function(_super) {
    __extends(App, _super);

    function App() {
      return App.__super__.constructor.apply(this, arguments);
    }

    App.prototype.initialize = function() {
      var deck;
      this.set('deck', deck = new Deck());
      this.set('playerHand', deck.dealPlayer());
      this.get('playerHand').on('stand', this.stand, this);
      this.get('playerHand').on('bust', this.bust, this);
      this.set('dealerHand', deck.dealDealer());
      this.get('dealerHand').on('win', this.win, this);
      return this.set('gameOver', false);
    };

    App.prototype.stand = function() {
      var _results;
      this.get('dealerHand').at(0).flip();
      _results = [];
      while (!this.get('gameOver')) {
        _results.push(this.get('dealerHand').hit());
      }
      return _results;
    };

    App.prototype.win = function() {
      var dealerScore, playerScore;
      playerScore = this.get('playerHand').scores()[0];
      dealerScore = this.get('dealerHand').scores()[0];
      if (dealerScore > playerScore && dealerScore <= 21) {
        this.set('winner', 'dealer');
        this.set('gameOver', true);
      }
      if (dealerScore > 21) {
        this.set('winner', 'player');
        this.set('gameOver', true);
      }
      if (dealerScore >= 17) {
        if (dealerScore > playerScore) {
          this.set('winner', 'dealer');
        } else if (dealerScore === playerScore) {
          this.set('winner', 'draw');
        } else {
          this.set('winner', 'player');
        }
        return this.set('gameOver', true);
      }
    };

    App.prototype.bust = function() {
      var playerScore;
      playerScore = this.get('playerHand').scores()[0];
      if (playerScore > 21) {
        this.set('winner', 'dealer');
        return this.set('gameOver', true);
      }
    };

    return App;

  })(Backbone.Model);

}).call(this);

//# sourceMappingURL=App.map
