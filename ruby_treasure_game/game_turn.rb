require_relative 'player'
require_relative 'die'
module GameTurn
  def self.take_turn(player)
    # die = Die.new
    # case die.roll
    # when 1..2
    #   puts 'player woot'
    #   player.woot
    # when 3..4
    #   puts 'was skipped'
    # else
    #   puts 'player blam'
    #   player.blam
    # end
    treasure = TreasureTrove.random
    player.found_treasure(treasure)
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
  end
end
