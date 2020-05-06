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
    @cards = CardGenerator.new(@filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end
end
