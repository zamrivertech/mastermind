# has peg colors and keys
class Peg
  # usable colors in game
  @colors = {
    'B' => :black,
    'W' => :white,
    'r' => :red,
    'g' => :green,
    'y' => :yellow,
    'b' => :blue,
    'm' => :magenta,
    'c' => :cyan
  }

  # acess usable game colors
  class << self
    attr_reader :colors
  end

  # get a specific color by first letter
  def self.color(key)
    @colors[key]
  end

  # get a random color
  def self.random_color
    @colors.to_a.sample[1]
  end
end
