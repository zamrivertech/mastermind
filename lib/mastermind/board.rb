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

  def current_color_row
    current_row = -1
    @color_board.each_with_index do |row, index|
      if row.include?(nil)
        current_row = index
        break
      end
    end
    current_row
  end
end
