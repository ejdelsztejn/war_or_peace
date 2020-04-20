require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'

class Start
  attr_reader :player1, :player2, :turn_num, :final_winner
  def initialize(player1, player2)
    @player1  = player1
    @player2  = player2
    @turn_num = 1
    @final_winner = ''
  end

  def play
    puts "Welcome to War! (or Peace) This game will be played with 52 cards."
    puts "The players today are #{player1.name} and #{player2.name}."
    puts "Type 'GO' to start the game!"
    puts "------------------------------------------------------------------"
    play = gets.chomp
    turn if play.upcase == 'GO'
  end

  def basic_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    puts "Turn #{@turn_num}: #{winner.name} won 2 cards"
  end

  def war_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    puts "Turn #{@turn_num}: WAR - #{winner.name} won 6 cards"
  end

  def mad_turn(turn)
    turn.pile_cards
    puts "Turn #{@turn_num}: *mutually assured destruction* 6 cards removed from play"
  end

  def turn
    loop do
      @player1.deck.cards.shuffle!
      @player2.deck.cards.shuffle!
      turn = Turn.new(@player1, @player2)
      if turn.type == :basic
        basic_turn(turn)
        @turn_num += 1
      elsif turn.type == :war
        war_turn(turn)
        @turn_num += 1
      elsif turn.type == :mutually_assured_destruction
        @turn_num += 1
      end
      break if player1.deck.cards.empty? || player2.deck.cards.empty? || @turn_num == 1_000_000
    end
    @final_winner = player2 if player1.deck.cards.empty?
    @final_winner = player1 if player2.deck.cards.empty?
    display_final_winner(final_winner)
  end

  def display_final_winner(final_winner)
    puts "The winner is #{final_winner.name}!"
  end
end
