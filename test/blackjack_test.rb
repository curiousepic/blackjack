require 'pry'

# TO-DO
# Hitting and Standing
# Busting
# Handling Ace variable value
# The Dealer's hand and score eval
# Winning evaluation
# Wagering


class Deck # The deck of all cards, reinitialized for each round
  attr_accessor :all_cards

  def initialize
    @all_cards = [
      {suit: "Clubs", rank: "Ace", value: 11},
      {suit: "Clubs", rank: "2", value: 2},
      {suit: "Clubs", rank: "3", value: 3},
      {suit: "Clubs", rank: "4", value: 4},
      # {suit: "Clubs", rank: "5", value: 5},
      # {suit: "Clubs", rank: "6", value: 6},
      # {suit: "Clubs", rank: "7", value: 7},
      # {suit: "Clubs", rank: "8", value: 8},
      # {suit: "Clubs", rank: "9", value: 9},
      # {suit: "Clubs", rank: "10", value: 10},
      # {suit: "Clubs", rank: "Jack", value: 10},
      # {suit: "Clubs", rank: "Queen", value: 10},
      # {suit: "Clubs", rank: "King", value: 10},
      # {suit: "Diamonds", rank: "Ace", value: 11},
      # {suit: "Diamonds", rank: "2", value: 2},
      # {suit: "Diamonds", rank: "3", value: 3},
      # {suit: "Diamonds", rank: "4", value: 4},
      # {suit: "Diamonds", rank: "5", value: 5},
      # {suit: "Diamonds", rank: "6", value: 6},
      # {suit: "Diamonds", rank: "7", value: 7},
      # {suit: "Diamonds", rank: "8", value: 8},
      # {suit: "Diamonds", rank: "9", value: 9},
      # {suit: "Diamonds", rank: "10", value: 10},
      # {suit: "Diamonds", rank: "Jack", value: 10},
      # {suit: "Diamonds", rank: "Queen", value: 10},
      # {suit: "Diamonds", rank: "King", value: 10},
      # {suit: "Hearts", rank: "Ace", value: 11},
      # {suit: "Hearts", rank: "2", value: 2},
      # {suit: "Hearts", rank: "3", value: 3},
      # {suit: "Hearts", rank: "4", value: 4},
      # {suit: "Hearts", rank: "5", value: 5},
      # {suit: "Hearts", rank: "6", value: 6},
      # {suit: "Hearts", rank: "7", value: 7},
      # {suit: "Hearts", rank: "8", value: 8},
      # {suit: "Hearts", rank: "9", value: 9},
      # {suit: "Hearts", rank: "10", value: 10},
      # {suit: "Hearts", rank: "Jack", value: 10},
      # {suit: "Hearts", rank: "Queen", value: 10},
      # {suit: "Hearts", rank: "King", value: 10},
      # {suit: "Spades", rank: "Ace", value: 11},
      # {suit: "Spades", rank: "2", value: 2},
      # {suit: "Spades", rank: "3", value: 3},
      # {suit: "Spades", rank: "4", value: 4},
      # {suit: "Spades", rank: "5", value: 5},
      # {suit: "Spades", rank: "6", value: 6},
      # {suit: "Spades", rank: "7", value: 7},
      # {suit: "Spades", rank: "8", value: 8},
      # {suit: "Spades", rank: "9", value: 9},
      # {suit: "Spades", rank: "10", value: 10},
      # {suit: "Spades", rank: "Jack", value: 10},
      # {suit: "Spades", rank: "Queen", value: 10},
      # {suit: "Spades", rank: "King", value: 10}
    ]
  end
end

class PlayerHand
  # gets dealt 2 cards, and allows them to be read to the player
  attr_accessor :hand_cards, :hand_total

  def initialize(dealer, deck)
    @hand_cards = [dealer.deal(deck), dealer.deal(deck)]
  end

  def total_hand
    # sum the values in the hand_cards array
    @hand_total = 0
    @hand_cards.each do |c|
      @hand_total = @hand_total + c[:value]
    end
  end

  def read_hand
    # tell me what the cards in the hand are, the total, and if Blackjack
    self.total_hand
    puts "Your hand: "
    @hand_cards.each do |c|
      puts "#{c[:rank]} of #{c[:suit]}"
    end
    puts "Your total: #{@hand_total}"
    if @hand_total == 21
      puts "Blackjack!!! You win."
    end
  end

end

class Dealer
  attr_accessor :card

  def deal(d)
    # give a random card from Deck and remove it from Deck
    place = d.all_cards.find_index((d.all_cards).sample)
    @card = d.all_cards.delete_at(place)
  end

  def ask_hit
    # not used yet
    puts "Hit (H) or Stand (S)?"
    answer = gets.chomp
    if answer.downcase == "h"

    end
  end

end

class DealerHand
  attr_accessor :hand_cards, :hand_total

  def initialize(dealer, deck)
    @hand_cards = [dealer.deal(deck), dealer.deal(deck)]
  end

  def total_hand
    # sum the values in the hand_cards array
    @hand_total = 0
    @hand_cards.each do |c|
      @hand_total = @hand_total + c[:value]
    end
  end

  def play
    self.total_hand
    puts "Dealer's hand:"
    @hand_cards.each do |c|
      puts "#{c[:rank]} of #{c[:suit]}"
    end
    puts "Dealer's total: #{@hand_total}"
    if @hand_total == 21
      puts "Blackjack!!! Dealer wins."
    end
  end

end

class Game
  attr_accessor :deck, :dealer, :test_hand

  def new_round
    @deck = Deck.new
    @dealer = Dealer.new
    @test_hand = PlayerHand.new(@dealer, @deck)
    @dealer_hand = DealerHand.new(@dealer, @deck)
    @test_hand.read_hand
    @dealer_hand.play
    self.ask_new_round
  end

  def ask_new_round
    puts "Another round? Y/N"
    answer = gets.chomp
    if answer.downcase == "y"
      self.new_round
    else
      exit
    end
  end

end

game = Game.new
game.new_round


# Currently unused Classes

class Round
  # Handles what happens before, during, after a Round
  # Before
  # Shuffle Deck
  # During
  # ???
  # After
  # Clean up Hands, handle Wallet changes
  # Ask if they want to play again
  # Do I need this with what I have in Game?
end



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

class Bouncer
  # will check Player's Wallet amount and keep them from playing
  # when they're out of money
end
