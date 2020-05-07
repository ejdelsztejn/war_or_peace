require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'

class StartTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Jessye", deck1)
    player2 = Player.new("Lynne", deck2)

    start = Start.new(player1, player2)

    assert_instance_of Start, start
  end

  def test_it_has_two_players
    # skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Jessye", deck1)
    player2 = Player.new("Lynne", deck2)

    start = Start.new(player1, player2)

    assert_equal "Jessye", start.player1.name
    assert_equal "Lynne", start.player2.name
  end

  def test_turn_num_starts_at_1
    # skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Jessye", deck1)
    player2 = Player.new("Lynne", deck2)

    start = Start.new(player1, player2)

    assert_equal 1, start.turn_num
  end

  def test_final_winner_starts_empty
    # skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Jessye", deck1)
    player2 = Player.new("Lynne", deck2)

    start = Start.new(player1, player2)

    assert_equal '', start.final_winner
  end

  def test_play_method
    skip
    # Need to figure out how to do this
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Jessye", deck1)
    player2 = Player.new("Lynne", deck2)

    start = Start.new(player1, player2)
  end

  def test_play_outputs_welcome
    skip
    card1 = Card.new(:heart, 'Jack', 11)
    card2 = Card.new(:heart, '10', 10)

    deck1 = Deck.new([card1])
    deck2 = Deck.new([card2])

    player1 = Player.new("Jessye", deck1)
    player2 = Player.new("Lynne", deck2)

    start = Start.new(player1, player2)
    assert_output("Welcome to War! (or Peace) This game will be played with 52 cards.", "o") do
      start.play
    end
  end

  def test_turn_creates_instance_of_turn_class
    skip
  end

  def test_basic_turn_if_turn_type_is_basic
    skip
  end

  def test_war_turn_if_turn_type_is_war
    skip
  end

  def test_mad_turn_if_turn_type_is_mad
    skip
  end

  def test_turn_num_accumulates_each_turn
    skip
  end

  def test_turn_loop_breaks_if_player_lost
    skip
  end

  def test_turn_loop_breaks_if_turn_num_is_1000000
    skip
  end

  def test_it_displays_final_winner
    skip
  end
end
