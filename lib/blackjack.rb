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
