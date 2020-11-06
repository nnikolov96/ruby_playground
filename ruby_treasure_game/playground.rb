require_relative 'player'
require_relative 'game'

player_1 = Player.new('niki')
player_2 = Player.new('Rado')
player_3 = Player.new('Sasho')

g = Game.new('Fortnite')
g.add_player(player_2)
g.add_player(player_1)
g.add_player(player_3)
g.play(3)
g.print_stats
puts "*" * 100
puts g.winner

