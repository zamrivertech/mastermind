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

  def self.total_color_rows
    color_peg_rows.count
  end

  def self.remain_empty_color_rows
  end

  def self.current_color_row
    current_row = total_color_rows - 1
  end
end
