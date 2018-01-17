require 'pry'
require_relative 'card'
require_relative 'deck'
require_relative 'hand'


class Blackjack
  def initialize
    @deck = Deck.new
    @player_hand = Hand.new
    @dealer_hand = Hand.new
    play
  end

  def play
    puts "Welcome to Blackjack!\n\n"
    player_turn
    dealer_turn unless @player_hand.score > 21
    puts outcome
  end

  def player_turn
    2.times { deal_card_to("Player") }
    puts "Player score: #{@player_hand.score}\n\n"
    player_choice = nil
    until player_choice == 's' || @player_hand.score >= 21
      player_choice = nil
      until valid_input?(player_choice)
        print "Hit or stand (H/S): "
        player_choice = gets.chomp.downcase
        puts
      end

      deal_card_to("Player") if player_choice == "h"
      puts "Player score: #{@player_hand.score}\n\n"
    end
  end

  def deal_card_to(user)
    dealt_card = @deck.draw!
    if user == "Player"
      @player_hand.add(dealt_card)
    elsif user == "Dealer"
      @dealer_hand.add(dealt_card)
    end
    puts "#{user} was dealt #{dealt_card.name}"
  end

  def valid_input?(input)
    ['h', 's'].include?(input)
  end

  def dealer_turn
    2.times { deal_card_to("Dealer") }
    puts "Dealer score: #{@dealer_hand.score}\n\n"
    until @dealer_hand.score >= 17
      deal_card_to("Dealer")
      puts "Dealer score: #{@dealer_hand.score}\n\n"
    end
  end

  def outcome
    if @player_hand.score == 21
    "BLACKJACK!\n\n Winner, winner, chicken dinner!!"
    elsif @player_hand.score > 21
    "Bust! You lose."
    elsif @dealer_hand.score > 21
      "Bust! You win!"
    elsif @player_hand.score > @dealer_hand.score
      "Dealer stands.\n\nYou win!"
    elsif @player_hand.score < @dealer_hand.score
      "Dealer stands.\n\nYou lose..."
    else
      "Dealer stands.\n\nPush"
    end
  end
end

Blackjack.new




































# require 'pry'
#
# require_relative "card"
# require_relative "deck"
# require_relative "hand"
#
# myDeck = Deck.new
#
# player = Hand.new
#
# puts "Welcome to Blackjack!\n"
#
# 2.times do
#   player.cards << myDeck.draw!
#   puts "Player was dealt #{player.cards[-1].show}"
# end
#
# puts "Player's score is #{player.calculate_hand}\n"
#
# if player.calculate_hand == 21
#   puts "Player stands."
# else
#   print "Hit or Stand (H/S): "
#   input = gets.chomp.downcase
#     if input == 's'
#       puts "Player stands."
#     end
# end
#
# while input == 'h'
#   player.cards << myDeck.draw!
#   puts "Player was dealt #{player.cards[-1].show}"
#   puts "Player's score is #{player.calculate_hand}\n"
#   if player.calculate_hand == 21
#     puts "Player stands."
#     break
#   elsif player.calculate_hand > 21
#     puts "Busted!"
#     exit!
#   else
#     print "Hit or Stand (H/S): "
#     input = gets.chomp.downcase
#   end
#   puts "Player stands."
# end
#
# dealer = Hand.new
#
# 2.times do
#   dealer.cards << myDeck.draw!
#   puts "Dealer was dealt #{dealer.cards[-1].show}"
# end
#
# puts "Dealer's score is: #{dealer.calculate_hand}"
#
# while dealer.calculate_hand < 17 || dealer.calculate_hand < player.calculate_hand
#   dealer.cards << myDeck.draw!
#   puts "Dealer hits!"
#   puts "Dealer was dealt #{dealer.cards[-1].show}"
#   puts "Dealer's score is: #{dealer.calculate_hand}"
# end
#
# if dealer.calculate_hand == player.calculate_hand
#   puts "It's a PUUSSSHHHH!!!!"
# elsif dealer.calculate_hand > player.calculate_hand && dealer.calculate_hand <= 21
#   puts "Dealer wins!"
# elsif player.calculate_hand == 21
#   puts "Blackjack! You win!"
# elsif dealer.calculate_hand < player.calculate_hand || dealer.calculate_hand > 21
#   puts "You win!"
# end
#
#
#
























# require 'pry'
#
# require_relative "card"
# require_relative "deck"
# require_relative "hand"
#
# myDeck = Deck.new
# player = Hand.new(myDeck)
# dealer = Hand.new(myDeck)
#
# puts dealer.dealerHand
#
# puts player.playerHand
# puts player.hitOrStand

















# if ["A"].include? player.cards[0].rank
#     puts "Do you want A to be 1 or 11?"
#     ace = gets.chomp
#     player.cards[0].value = ace
#   else
# end
