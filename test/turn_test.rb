require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test
  def basic_setup
    basic_card1 = Card.new(:heart, 'Jack', 11)
    basic_card2 = Card.new(:heart, '10', 10)
    basic_card3 = Card.new(:heart, '9', 9)
    basic_card4 = Card.new(:diamond, 'Jack', 11)
    basic_card5 = Card.new(:heart, '8', 8)
    basic_card6 = Card.new(:diamond, 'Queen', 12)
    basic_card7 = Card.new(:heart, '3', 3)
    basic_card8 = Card.new(:diamond, '2', 2)

    basic_deck1 = Deck.new([basic_card1, basic_card2, basic_card5, basic_card8])
    basic_deck2 = Deck.new([basic_card3, basic_card4, basic_card6, basic_card7])

    basic_player1 = Player.new('Megan', basic_deck1)
    basic_player2 = Player.new('Aurora', basic_deck2)

    @basic_turn = Turn.new(basic_player1, basic_player2)
  end

  def war_setup
    war_card1 = Card.new(:heart, 'Jack', 11)
    war_card2 = Card.new(:heart, '10', 10)
    war_card3 = Card.new(:heart, '9', 9)
    war_card4 = Card.new(:diamond, 'Jack', 11)
    war_card5 = Card.new(:heart, '8', 8)
    war_card6 = Card.new(:diamond, 'Queen', 12)
    war_card7 = Card.new(:heart, '3', 3)
    war_card8 = Card.new(:diamond, '2', 2)

    war_deck1 = Deck.new([war_card1, war_card2, war_card5, war_card8])
    war_deck2 = Deck.new([war_card4, war_card3, war_card6, war_card7])

    war_player1 = Player.new('Megan', war_deck1)
    war_player2 = Player.new('Aurora', war_deck2)

    @war_turn = Turn.new(war_player1, war_player2)
  end

  def mad_setup
    mad_card1 = Card.new(:heart, 'Jack', 11)
    mad_card2 = Card.new(:heart, '10', 10)
    mad_card3 = Card.new(:heart, '9', 9)
    mad_card4 = Card.new(:diamond, 'Jack', 11)
    mad_card5 = Card.new(:heart, '8', 8)
    mad_card6 = Card.new(:diamond, '8', 8)
    mad_card7 = Card.new(:heart, '3', 3)
    mad_card8 = Card.new(:diamond, '2', 2)

    mad_deck1 = Deck.new([mad_card1, mad_card2, mad_card5, mad_card8])
    mad_deck2 = Deck.new([mad_card4, mad_card3, mad_card6, mad_card7])

    mad_player1 = Player.new('Megan', mad_deck1)
    mad_player2 = Player.new('Aurora', mad_deck2)
    @mad_turn = Turn.new(mad_player1, mad_player2)
  end

  def test_it_exists
    basic_setup
    war_setup
    mad_setup

    assert_instance_of Turn, @basic_turn
    assert_instance_of Turn, @war_turn
    assert_instance_of Turn, @mad_turn
  end

  def test_it_has_player_1
    skip
    assert_equal 'Megan', @turn.player1
  end

  def test_spoils_of_war_starts_empty
    basic_setup

    assert @basic_turn.spoils_of_war.empty?
  end

  def test_type_is_basic
    basic_setup

    assert_equal :basic, @basic_turn.type
  end

  def test_basic_winner_is_player1
    basic_setup
    @basic_winner = @basic_turn.winner

    assert_equal 'Megan', @basic_winner.name
  end

  def test_awards_spoils_to_winner
    basic_setup
    @basic_winner = @basic_turn.winner
    @basic_turn.pile_cards
    @basic_turn.award_spoils(@basic_winner)

    assert_empty @basic_turn.spoils_of_war
    assert_equal 5, @basic_turn.player1.deck.cards.count
    assert_equal 3, @basic_turn.player2.deck.cards.count
  end

  def test_type_is_war
    war_setup

    assert_equal :war, @war_turn.type
  end

  def test_war_winner_is_player2
    war_setup
    @war_winner = @war_turn.winner

    assert_equal 'Aurora', @war_winner.name
  end

  def test_type_is_mutually_assured_destruction
    mad_setup

    assert_equal :mutually_assured_destruction, @mad_turn.type
  end

  def test_mad_has_no_winner
    mad_setup
    @mad_winner = @mad_turn.winner

    assert_equal 'No Winner', @mad_winner
  end
end
