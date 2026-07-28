# Board Class: responsible for Mastermind board structure
class Board
  attr_reader :color_board, :key_board

  def initialize(pegs, rows)
    @color_board = Array.new(rows) { Array.new(pegs) }
    @key_board = Array.new(rows) { Array.new(pegs) }
  end

  def add_color(color, row, index)
    @color_board[row][index] = color
  end
end
