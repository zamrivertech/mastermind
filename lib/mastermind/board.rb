# handles mastermind's board structure for key and peg colors
class Board
  attr_reader :color_board, :key_board

  # new class to establish rows of keys and colors
  def initialize(pegs, rows)
    @color_board = Array.new(rows) { Array.new(pegs) }
    @key_board = Array.new(rows) { Array.new(pegs) }
  end

  # add or try a color on a row on the color board
  def add_color(color, row, index)
    puts @color_board[row][index]
    @color_board[row][index] = color
  end

  # add a key feedback on a row on the keyboard board
  def add_key(color, row, index)
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
  def current_color_row_index
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
  def current_key_row
    current_color_row_index
  end

  # return the index of the previous color row
  def previous_color_row
    @color_board[current_color_row - 1]
  end
end
