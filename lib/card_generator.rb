require './lib/card'
require 'csv'

class CardGenerator
  attr_reader :file

  def initialize(file)
    @file = CSV.read(file)
  end

  def cards
    deck = @file.map do |card|
      new_card = Card.new(card[1].lstrip.downcase.to_sym, card[0], card[2].lstrip.to_i)
    end
  end
end
