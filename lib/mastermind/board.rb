# handles mastermind's board structure for key and peg colors
class Board
  @color_board = Array.new(12) { Array.new(4) }
  @key_board = Array.new(12) { Array.new(4) }
  @row_index = 0

  class << self
    attr_reader :color_board, :key_board, :row_index
  end

  # add or try a color on a row on the color board
  def self.add_color(color, row, index)
    return unless index >= 0 && index <= 3

    @color_board[row][index] = color
  end

  # add a key feedback on a row on the keyboard board
  def self.add_key(color, row, index)
    @key_board[row][index] = color
  end

  def self.next_row
    @row_index += 1
  end

  def self.current_color_row
    @color_board[@row_index]
  end

  def self.current_key_row
    @color_board[@row_index]
  end

  def self.current_color_row_full?
    @color_board[@row_index].count(nil).zero?
  end

  def self.last_color_row_full?
    @color_board[@color_board.length - 1].count(nil).zero?
  end

  def self.last_color_row
    @color_board[@color_board.length - 1]
  end
end
