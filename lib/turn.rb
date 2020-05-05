require './lib/card'
require './lib/deck'
require './lib/player'

class Turn
  attr_reader :player1, :player2, :spoils_of_war, :type
  def initialize(p1, p2)
    @player1       = p1
    @player2       = p2
    @spoils_of_war = []
    @type          = determine_turn_type
  end

  def determine_turn_type
    return :mutually_assured_destruction if top_card_same_rank? && third_card_same_rank?
    return :war if top_card_same_rank?
    return :basic if !top_card_same_rank?
  end

  def top_card_same_rank?
    player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
  end

  def third_card_same_rank?
    player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
  end

  def winner
    if type == :basic
      return player1 if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player2 if player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
    elsif type == :war
      return player1 if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player2 if player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
    else
      return "No Winner"
    end
  end

  def pile_cards
    if type == :basic
      @spoils_of_war << player1.deck.cards.shift
      @spoils_of_war << player2.deck.cards.shift
    elsif type == :war
      @spoils_of_war << player1.deck.cards.slice!(0..2)
      @spoils_of_war << player2.deck.cards.slice!(0..2)
    else
      player1.deck.cards.slice!(0..2)
      player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    unless winner.nil?
      winner.deck.cards << @spoils_of_war
      winner.deck.cards.flatten!
      @spoils_of_war = []
    end
  end

end
