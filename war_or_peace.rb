require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/start'
require './lib/card_generator'

filename = './lib/cards.txt'
standard_deck = CardGenerator.new(filename).cards

shuffled = standard_deck.shuffle

deck1 = Deck.new(shuffled.slice!(0..4))
deck2 = Deck.new(shuffled.slice!(0..4))

player1 = Player.new("Jessye", deck1)
player2 = Player.new("Lynne", deck2)

start = Start.new(player1, player2)
start.play
