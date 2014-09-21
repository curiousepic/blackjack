require 'pry'

class AllCards # list of all the cards available to make a RoundDeck from
  attr_accessor :all_cards

  def initialize
    @all_cards = [
      {suit: "Clubs", rank: "Ace", value: 11},
      {suit: "Clubs", rank: "2", value: 2},
      {suit: "Clubs", rank: "3", value: 3},
      {suit: "Clubs", rank: "4", value: 4},
      {suit: "Clubs", rank: "5", value: 5},
      {suit: "Clubs", rank: "6", value: 6},
      {suit: "Clubs", rank: "7", value: 7},
      {suit: "Clubs", rank: "8", value: 8},
      {suit: "Clubs", rank: "9", value: 9},
      {suit: "Clubs", rank: "10", value: 10},
      {suit: "Clubs", rank: "Jack", value: 10},
      {suit: "Clubs", rank: "Queen", value: 10},
      {suit: "Clubs", rank: "King", value: 10},
      {suit: "Diamonds", rank: "Ace", value: 11},
      {suit: "Diamonds", rank: "2", value: 2},
      {suit: "Diamonds", rank: "3", value: 3},
      {suit: "Diamonds", rank: "4", value: 4},
      {suit: "Diamonds", rank: "5", value: 5},
      {suit: "Diamonds", rank: "6", value: 6},
      {suit: "Diamonds", rank: "7", value: 7},
      {suit: "Diamonds", rank: "8", value: 8},
      {suit: "Diamonds", rank: "9", value: 9},
      {suit: "Diamonds", rank: "10", value: 10},
      {suit: "Diamonds", rank: "Jack", value: 10},
      {suit: "Diamonds", rank: "Queen", value: 10},
      {suit: "Diamonds", rank: "King", value: 10},
      {suit: "Hearts", rank: "Ace", value: 11},
      {suit: "Hearts", rank: "2", value: 2},
      {suit: "Hearts", rank: "3", value: 3},
      {suit: "Hearts", rank: "4", value: 4},
      {suit: "Hearts", rank: "5", value: 5},
      {suit: "Hearts", rank: "6", value: 6},
      {suit: "Hearts", rank: "7", value: 7},
      {suit: "Hearts", rank: "8", value: 8},
      {suit: "Hearts", rank: "9", value: 9},
      {suit: "Hearts", rank: "10", value: 10},
      {suit: "Hearts", rank: "Jack", value: 10},
      {suit: "Hearts", rank: "Queen", value: 10},
      {suit: "Hearts", rank: "King", value: 10},
      {suit: "Spades", rank: "Ace", value: 11},
      {suit: "Spades", rank: "2", value: 2},
      {suit: "Spades", rank: "3", value: 3},
      {suit: "Spades", rank: "4", value: 4},
      {suit: "Spades", rank: "5", value: 5},
      {suit: "Spades", rank: "6", value: 6},
      {suit: "Spades", rank: "7", value: 7},
      {suit: "Spades", rank: "8", value: 8},
      {suit: "Spades", rank: "9", value: 9},
      {suit: "Spades", rank: "10", value: 10},
      {suit: "Spades", rank: "Jack", value: 10},
      {suit: "Spades", rank: "Queen", value: 10},
      {suit: "Spades", rank: "King", value: 10}
    ]
  end
end

class RoundDeck
  # makes a deck instance to use for the round in a specific order
  # (NOT CURRENTLY REORDERING)
  # ...I don't need to reorder/shuffle the array if I just pull a random card
  # and then each round start from the full deck
  attr_accessor :deck_order
  def initialize
    round_deck = AllCards.new
    @deck_order = round_deck.all_cards
  end
end
#
# class Card
#   # takes a card hash and allows things to be done to it
#   attr_accessor :suit, :rank, :value
#
#   def initialize(card)
#   @suit = card[:suit]
#   @rank = card[:rank]
#   @value = card[:value]
#   end
#
#   def card_name
#     "#{@rank} of #{@suit}"
#   end
#
#   ## It's interesting (and maybe not idiomatic, though there might be good
#   #  reasons to do it) that you have a whole list of things that look like
#   #  cards in AllCards, and then when you want to manipulate a specific card,
#   #  you have to instantiate another object to do it. But, if there is a reason
#   #  for things to be set up this way, by all means continue.
#
# end

class TestHand
  # gets dealt 2 cards, and allows them to be read to the player
  attr_accessor :deal1, :deal2, :deal1name, :deal2name
  def initialize(dealer, deck)
    @deal1 = dealer.deal(deck)
    @deal2 = dealer.deal(deck)
  end
  def read_hand
    # tell me what the cards in the hand are

    # @deal1name = Card.new(@deal1)
    # @deal2name = Card.new(@deal2)

    puts "You have a #{@deal1[:rank]} of #{@deal1[:suit]}"\
         " and a #{@deal2[:rank]} of #{@deal2[:suit]}."

    # binding.pry

  end
end

class TestDealer
  # give a random card from RoundDeck
  # (NOT CURRENTLY REMOVING FROM DECK, so duplicates will happen)
  attr_accessor :card
  def deal(d)
    @card = (d.deck_order).sample

  end
end

class Game
  attr_accessor :deck, :dealer, :test_hand
  def initialize
    @deck = RoundDeck.new
    @dealer = TestDealer.new
    @test_hand = TestHand.new(@dealer, @deck)
    @test_hand.read_hand
  end
end

game = Game.new


class Hand
  # A set of cards that the Player and Dealer will have
end

class Dealer
  # Removes a card from the Deck
  # and assigns it to a Hand
  # Prompts user for Hitting or Standing?
  # Called by Round?
end

class Player
  # Keeps track of the Player's... stuff
end

class Money
  # What Money is - bets = $10
end

class Wallet
  # Holds the Player's money - starts at $100
end

class EvaluateScore
  # Looks at Hands and determines their score, handles variable Ace value
end

class Round
  # Handles what happens before, during, after a Round
    # Before
      # Shuffle Deck
    # During
      # ???
    # After
      # Clean up Hands, handle Wallet changes
      # Ask if they want to play again
end

class Bouncer
  # will check Player's Wallet amount and keep them from playing
  # when they're out of money
end
