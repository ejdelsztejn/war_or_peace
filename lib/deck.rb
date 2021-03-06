require './lib/card'

class Deck
  attr_reader :cards
  def initialize(cards)
    @cards = cards
  end

  def rank_of_card_at(index)
    if cards[index]
      cards[index].rank
    else
      return 0
    end
  end

  def high_ranking_cards
    cards.select {|card| card.rank >= 11}
  end

  def percent_high_ranking
    ((self.high_ranking_cards.size.to_f / cards.size.to_f ) * 100).round(2)
  end

  def remove_card
    cards.shift
  end

  def add_card(card)
    cards.push(card)
  end
end
