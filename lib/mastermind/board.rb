# handles mastermind's board structure for key peg and peg colors
class Board
  # color board guesses with 12 rows and 4 spaces
  @color_board = Array.new(12) { Array.new(4) }
  # key board feedback with 12 rows and 4 spaces
  @key_board = Array.new(12) { Array.new(4) }
  @row_index = 0

  class << self
    # access to color board, key board and current acting row
    attr_reader :color_board, :key_board, :row_index
  end

  # add a color on a row position on the color board
  def self.add_color(color, row, index)
    return unless index >= 0 && index <= 3

    @color_board[row][index] = color
  end

  # add a key feedback on a row on the keyboard board
  def self.add_key(color, row, index)
    @key_board[row][index] = color
  end

  # add a key by a number of times
  def self.add_key_times(color, count)
    count.to_i
    while count.positive?
      @key_board.current_key_row.unshift(color)
      @key_board.current_key_row.pop
      break if count.zero?

      count -= 1
    end
  end

  # move to next row
  def self.next_row
    @row_index += 1
  end

  # current acting color row
  def self.current_color_row
    @color_board[@row_index]
  end

  # current acting feedback row
  def self.current_key_row
    @key_board[@row_index]
  end

  # if current acting color row is full
  def self.current_color_row_full?
    @color_board[@row_index].count(nil).zero?
  end

  # if last acting color row is full
  def self.last_color_row_full?
    @color_board[@color_board.length - 1].count(nil).zero?
  end

  # get the last color row in board
  def self.last_color_row
    @color_board[@color_board.length - 1]
  end
end
