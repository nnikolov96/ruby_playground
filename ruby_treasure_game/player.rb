require_relative 'treasure_trove'
class Player
  attr_accessor :name, :health, :found_treasures

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    @name
  end

  def score
    @health + treasure_points
  end

  def ==(other)
    score <=> other.score
  end

  def treasure_points
    @found_treasures.values.reduce(0, :+)
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
  end

  def blam
    @health += 10
  end

  def woot
    @health -= 10
  end

  def strong?
    @health >= 100
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end
end
