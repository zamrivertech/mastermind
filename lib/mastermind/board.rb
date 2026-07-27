# Board Class: responsible for Mastermind board structure
class Board
  @grid = Array.new(4) { Array.new(4) }

  class << self
    attr_reader :grid
  end

  def self.color_peg_rows
    # left is even so color
    @grid.select.with_index { |item, index| item if index.even? }
  end

  def self.key_peg_rows
    # right is odd so key pegs
    @grid.select.with_index { |item, index| item if index.odd? }
  end

  def self.add_color(color, row, index)
    color_peg_rows[row][index] = color
  end
end
