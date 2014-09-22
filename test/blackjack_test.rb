require 'pry'

# TO-DO
# Betting/wagering


class Deck # The deck of all cards, reinitialized for each round
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

class PlayerHand
  # gets dealt 2 cards, and allows them to be read to the player
  attr_accessor :hand_cards, :hand_total

  def initialize(dealer, deck)
    @dealer = dealer
    @deck = deck
    @hand_cards = [@dealer.deal(@deck), @dealer.deal(@deck)]
  end

  def total_hand
    # sum the values in the hand_cards array
    @hand_total = 0
    @hand_cards.each do |c|
      @hand_total = @hand_total + c[:value]
    end
    # check for an ace and score over 21
    if @hand_total > 21 &&
      @hand_cards.find do |v|
        v[:value] == 11
      end
      self.ace_handler
    else
      @hand_total
    end
  end

  def ace_handler
    # make the hand's ace(s) value = 1
    puts "This hand has an Ace and is over 21. Making Ace worth 1."
    ace = @hand_cards.find do |v|
      v[:value] == 11
    end
    ace[:value] = 1
    self.total_hand
  end

  def play
    # start the player's turn
    self.total_hand
    puts "Your hand: "
    @hand_cards.each do |c|
      puts "#{c[:rank]} of #{c[:suit]}"
    end
    puts "Your total: #{@hand_total}"
    if @hand_total == 21
      puts "Blackjack!!!"
    else
      self.hit
    end
  end

  def hit
    puts "(H)it or (S)tand?"
    answer = gets.chomp
    if answer.downcase == "h"
      puts "You hit:"
      @hand_cards << @dealer.deal(@deck)
      puts "#{@hand_cards.last[:rank]} of #{@hand_cards.last[:suit]}"
      self.eval_hand
    end
  end

  def eval_hand
    self.total_hand
    if @hand_total > 21
      puts "You bust at #{@hand_total}!"
    elsif @hand_total == 21
      puts "21!"
    else
      puts "Your total: #{@hand_total}"
      self.hit
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
      # ???
    end
  end

end

class DealerHand
  attr_accessor :hand_cards, :hand_total

  def initialize(dealer, deck)
    @dealer = dealer
    @deck = deck
    @hand_cards = [@dealer.deal(@deck), @dealer.deal(@deck)]
  end

  def total_hand
    # sum the values in the hand_cards array
    @hand_total = 0
    @hand_cards.each do |c|
      @hand_total = @hand_total + c[:value]
    end
    # check for an ace and score over 21
    if @hand_total > 21 &&
      @hand_cards.find do |v|
        v[:value] == 11
      end
      self.ace_handler
    else
      @hand_total
    end
  end

  def ace_handler
    # make the hand's ace(s) value = 1
    puts "This hand has an Ace and is over 21. Making Ace worth 1."
    ace = @hand_cards.find do |v|
      v[:value] == 11
    end
    ace[:value] = 1
    self.total_hand
  end

  def play
    # begin dealer's turn
    self.total_hand
    puts "\nDealer's hand:"
    @hand_cards.each do |c|
      puts "#{c[:rank]} of #{c[:suit]}"
    end
    self.eval_hand
  end

  def hit
    # give dealer's hand a new card
    puts "Dealer hits:"
    @hand_cards << @dealer.deal(@deck)
    puts "#{@hand_cards.last[:rank]} of #{@hand_cards.last[:suit]}"
    self.eval_hand
  end

  def eval_hand
    # have dealer hit or stand in right circumstances
    self.total_hand
    if @hand_total > 21
      puts "Dealer busts at #{@hand_total}."
    elsif @hand_total == 21 && @hand_cards.length == 2
      puts "Blackjack!!! Dealer wins."
    elsif @hand_total > 16
      puts "Dealer stands at #{@hand_total}."
    else self.hit
    end
  end

end

class Game
  attr_accessor :deck, :dealer, :player_hand, :dealer_hand

  def new_round
    puts "\n\n"
    @deck = Deck.new
    @dealer = Dealer.new
    @player_hand = PlayerHand.new(@dealer, @deck)
    @dealer_hand = DealerHand.new(@dealer, @deck)
    @player_hand.play
    self.check_bust
    @dealer_hand.play
    self.check_winner
    self.ask_new_round
  end

  def ask_new_round
    puts "\nAnother round? Y/N"
    answer = gets.chomp
    if answer.downcase == "y"
      self.new_round
    else
      exit
    end
  end

  def check_bust
    puts "Checking for bust..."
    if @player_hand.hand_total > 21
      puts "Player busts and loses!"
      self.ask_new_round
    else
      puts "No player bust."
    end
  end

  def check_winner
    puts "Checking for winner..."
    if @player_hand.hand_cards.length == 2 &&
      @dealer_hand.hand_cards.length == 2 &&
      @player_hand.hand_total == 21 &&
      @dealer_hand.hand_total == 21
      puts "Dealer's Blackjack trumps yours!!! Better luck next time."
    elsif
      @player_hand.hand_cards.length == 2 &&
      @player_hand.hand_total == 21
      puts "You win with a Blackjack!!!"
    elsif
      @dealer_hand.hand_total > 21
      puts "Dealer busted, you win!"
    elsif
      @player_hand.hand_total == @dealer_hand.hand_total
      puts "Push! No winner this round."
    elsif
      @player_hand.hand_total > @dealer_hand.hand_total
      puts "With a higher score, you win!"
    else
      puts "With a higher score, the dealer wins."
    end
  end


end

game = Game.new
game.new_round


# Currently unused Classes


class Money
  # What Money is - bets = $10
end

class Wallet
  # Holds the Player's money - starts at $100
end

class Bouncer
  # will check Player's Wallet amount and keep them from playing
  # when they're out of money
end
