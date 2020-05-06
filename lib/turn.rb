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
    if top_card_same_rank? && third_card_same_rank?
      :mutually_assured_destruction
    elsif top_card_same_rank? && !third_card_same_rank?
      :war
    else
      :basic
    end
  end

  def top_card_same_rank?
    if player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0)
      return true
    else
      return false
    end
  end

  def third_card_same_rank?
    if player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
      return true
    else
      return false
    end
  end

  def winner
    if type == :basic
      return player1 if player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0)
      return player2 if player1.deck.rank_of_card_at(0) < player2.deck.rank_of_card_at(0)
    elsif type == :war
      return player1 if player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2)
      return player2 if player1.deck.rank_of_card_at(2) < player2.deck.rank_of_card_at(2)
    elsif :mutually_assured_destruction
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
    elsif type == :mutually_assured_destruction
      player1.deck.cards.slice!(0..2)
      player2.deck.cards.slice!(0..2)
    end
  end

  def award_spoils(winner)
    winner.deck.cards << @spoils_of_war.shuffle
    winner.deck.cards.flatten!
    @spoils_of_war = []
  end

end
