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
    p "Welcome to War! (or Peace) This game will be played with 52 cards."
    p "The players today are #{player1.name} and #{player2.name}."
    p "Type 'GO' to start the game!"
    p "------------------------------------------------------------------"
    play = gets.chomp
    turn if play.upcase == 'GO'
  end

  def basic_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    p "Turn #{@turn_num}: #{winner.name} won 2 cards"
  end

  def war_turn(turn)
    winner = turn.winner
    turn.pile_cards
    turn.award_spoils(winner)
    p "Turn #{@turn_num}: WAR - #{winner.name} won 6 cards"
  end

  def mad_turn(turn)
    turn.pile_cards
    p "Turn #{@turn_num}: *mutually assured destruction* 6 cards removed from play"
  end

  def turn
    loop do
      turn = Turn.new(@player1, @player2)
  
      basic_turn(turn) if turn.type == :basic
      war_turn(turn) if turn.type == :war
      mad_turn(turn) if turn.type == :mutually_assured_destruction

      @turn_num += 1
      break if player1.has_lost? || player2.has_lost? || @turn_num == 1_000_000
    end
    @final_winner = player2 if player1.has_lost?
    @final_winner = player1 if player2.has_lost?
    display_final_winner(final_winner)
  end

  def display_final_winner(final_winner)
    if final_winner != ''
      p "The winner is #{final_winner.name}!"
    else
      p "DRAW!"
    end
  end
end
