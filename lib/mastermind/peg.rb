# Peg Class: responsible for handling key and color peg definition and colors
class Peg
  @colors = %i[green blue yellow red]
  @keys = %i[grey white]

  class << self
    attr_reader :colors, :keys
  end

  def self.color(key)
    @colors[key]
  end
end
