require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require './lib/card_generator'

class CardGeneratorTest < MiniTest::Test
  def setup
    @filename = './lib/cards.txt'
    @standard_deck = CardGenerator.new(filename).cards
  end
end
