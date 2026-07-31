# has peg colors and keys
class Peg
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

  class << self
    attr_reader :colors
  end

  def self.color(key)
    @colors[key]
  end

  #
  # white means correct color in wrong position
  # black means correct color in correct position
end
