# has peg colors and keys
class Peg
  @colors = %i[
    black
    red
    green
    yellow
    blue
    magenta
    cyan
    white
  ]
  @keys = %i[grey white]

  class << self
    attr_reader :colors, :keys
  end

  def self.color(key)
    @colors[key]
  end

  #
  # white means correct color in wrong position
  # black means correct color in correct position
end
