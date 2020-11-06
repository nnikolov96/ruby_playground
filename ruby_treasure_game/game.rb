require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  def initialize(title, players = [])
    @title = title
    @players = players
  end

  def add_player(player)
    @players << player
  end

  def play(rounds)
    1.upto(rounds) do
      @players.each do |player|
        GameTurn.take_turn(player)
        # puts "#{player.name} , #{player.score}"
      end
    end
  end

  def <=>(other)
    other.score <=> score
  end

  def print_stats
    strong_players, wimp_players = @players.partition(&:strong?)

    @players.sort.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.treasure_points} grand total points"
    end
  end

  def winner
    @players.min { |a, b| b.score <=> a.score }
  end
end
