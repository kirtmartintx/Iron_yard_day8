# have: cards in suits, 52 cards in one deck
# a dealer, a player, a method to deal cards
# a way to track which card is with a dealer, player
# cards are 1..11, aces are 11's, face cards are 10's
# New deck every game, deck must be shuffled every game
# You enter what you play
# get as close to 21 without going over
# you can see 1 of dealers cards, while you are playing
# If you get blackjack, you win automagically

# shuffle cards
# deal cards, one of dealers cards face up?
# have the ability to hit player or dealer, dealer stands on 16
# coompare hands
# determine winner




# class Player
#   attr_accessor :name
#
#   def initialize(name)
#   @name = name
#   end
# end

# class Dealer
#   def initialize(dealer)
#     @dealer = dealer
#     p " I will be your dealer."
#   end
# end
#
class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def new_card(card)
    @cards << card
  end

  def value
    total = 0
    @cards.each do |card|
      total += card.value
    end
    total
  end
end
#
# class Game
# end
#
#
# deck = Deck.new
# p deck.cards

class Card

  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def value
    if ["J", "Q", "K"].include? @value
      return 10
    elsif @value == "A"
      return 11
    else
      return @value
    end
  end

  def to_s
    [suit,value].join('-')
  end
end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []

    suits = [:hearts, :diamonds, :spades, :clubs]
    suits.each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      @cards << Card.new(suit, "J")
      @cards << Card.new(suit, "Q")
      @cards << Card.new(suit, "K")
      @cards << Card.new(suit, "A")
    end

    @cards.shuffle!

  end

  def deal
    @cards.shift
  end

end


deck = Deck.new


puts "What is your name?"
name = gets.chomp
puts "Welcome to BlackJack #{name}."

player_hand = Hand.new
dealer_hand = Hand.new

2.times do
  player_hand.new_card(deck.deal)
  dealer_hand.new_card(deck.deal)
end

p "Your cards: #{player_hand.cards.join(" ")}"
puts "Dealer has: #{dealer_hand.cards.first}"

puts "Hit or Stay? (h/s)"
choice = gets.chomp

until player_hand.value > 21 || choice == "s"

if choice == "h"
  player_hand.new_card(deck.deal)
else choice == "s"
  puts "stay"

end
end

if dealer_hand.value < 16
  dealer_hand.new_card(deck.deal)
else
  puts "Dealer stays"
end

puts "Your cards: #{player_hand.cards.join(" ")}"
puts "Dealer has: #{dealer_hand.cards.join(" ")}"

puts "Who won?"
if dealer_hand.value < player_hand.value && player_hand.value <= 21
  puts "YOU WON BABY"
else
  puts "BOOM YOU LOST"
end



# TODO: allow me to hit multiple times
# TODO: keep hitting the dealer until he reaches 16
