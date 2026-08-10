# handles mastermind's board structure for key and peg colors
class Board
  @color_board = Array.new(12) { Array.new(4) }
  @key_board = Array.new(12) { Array.new(4) }

  class << self
    attr_reader :color_board, :key_board
  end

  # add or try a color on a row on the color board
  def self.add_color(color, row, index)
    return unless index >= 0 && index <= 3

    @color_board[row][index] = color
  end

  # add a key feedback on a row on the keyboard board
  def self.add_key(color, row)
    @key_board[row].unshift(color)
    @key_board[row].slice!(@key_board[row].index(nil), 1) if @key_board[row].include?(nil)
  end

  # return the index of the current working row
  def self.current_color_row_index
    current_row = -1
    @color_board.each_with_index do |row, index|
      if row.include?(nil)
        current_row = index
        break
      else
        current_row = @color_board.length - 1
      end
    end
    current_row
  end

  # return the current key row
  def self.current_key_row
    @key_board[current_color_row_index]
  end

  # return the color key row
  def self.current_color_row
    @color_board[current_color_row_index]
  end

  # return true if previous color row is full
  def self.previous_color_row_full?
    previous_row = @color_board[current_color_row_index - 1]
    true if current_color_row_index >= 0 && !previous_row.include?(nil)
  end

  # return true if previous color row is full
  def self.current_color_row_full?
    current_row = @color_board[current_color_row_index]
    true if current_color_row_index >= 0 && !current_row.include?(nil)
  end

  # return previous color row
  def self.previous_color_row
    previous_row = @color_board[current_color_row_index - 1]
    previous_row if current_color_row_index >= 0
  end

  # return previous key row
  def self.previous_key_row
    previous_row = @key_board[current_color_row_index - 1]
    previous_row if current_color_row_index >= 0
  end

  # return previous color row
  def self.previous_color_row_index
    current_color_row_index - 1
  end

  # return true if last space in row to add peg
  def self.last_color_peg_in_row?
    true if @color_board[current_color_row_index].count(nil) == 1
  end

  def self.last_color_row?
    current_color_row_index == @color_board.length - 1
  end

  def self.last_color_row
    @color_board[@color_board.length - 1]
  end

  def self.last_color_row_full?
    true unless last_color_row.include?(nil)
  end
end
