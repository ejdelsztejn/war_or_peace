require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require './lib/card_generator'
require 'csv'

class CardGeneratorTest < MiniTest::Test
  def setup
    @filename = './lib/cards.txt'
    @cards = CardGenerator.new(@filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_it_reads_a_text_file
    file = CSV.read(@filename)

    assert_equal file, @cards.file
  end

  def test_it_creates_cards
    deck = @cards.cards

    assert_instance_of Card, deck.sample
  end
end
