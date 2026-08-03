# handles mastermind's board structure for key and peg colors
class Board
  @color_board = Array.new(4) { Array.new(4) }
  @key_board = Array.new(4) { Array.new(4) }

  class << self
    attr_reader :color_board, :key_board
  end

  # add or try a color on a row on the color board
  def self.add_color(color, row, index)
    return unless index >= 0 && index <= 3

    @color_board[row][index] = color
  end

  # add a key feedback on a row on the keyboard board
  def self.add_key(color, row, index)
    # keyboard breaker is able to add more rows, need to validate input here
    # too
    if !@color_board[current_color_row_index].include(nil)
      puts 'Hello, are you sure?'
    else
      p @color_board[current_color_row_index].include(nil)
      @key_board[row][index] = color
    end
  end

  # return the index of the current working row
  def self.current_color_row_index
    current_row = -1
    @color_board.each_with_index do |row, index|
      if row.include?(nil)
        current_row = index
        break
      end
    end
    current_row
  end

  # return the index of the current key row
  def self.current_key_row
    current_color_row_index
  end

  # return the index of the previous color row
  def self.previous_color_row
    @color_board[current_color_row - 1]
  end

  # return true if last space in row to add peg
  def self.last_color_peg_in_row?
    true if @color_board[current_color_row_index].count(nil) == 1
  end
end
