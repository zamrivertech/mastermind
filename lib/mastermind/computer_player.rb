# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player

  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
    shuffle_keyboard_rows
  end

  def shuffle_keyboard_rows
    count = 0
    while count < Board.key_board.length - 1
      Board.key_board[count].shuffle!
      count += 1
    end
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.random_color, Peg.random_color, Peg.random_color, Peg.random_color]
  end

  def feedback(code)
    white_feedback(black_feedback(code))
  end

  # add black key peg feedback
  def black_feedback(code)
    remain_code = code.dup
    row = Board.current_color_row
    row_index = Board.row_index
    row.each_with_index do |tried_color, tried_color_index|
      if tried_color == code[tried_color_index] && tried_color_index == code.index(tried_color)
        Board.add_key(:black, row_index, tried_color_index)
        remain_code.slice!(remain_code.index(tried_color), 1)
      end
    end
    remain_code
  end

  # add white key peg feedback
  def white_feedback(remain_code)
    row = Board.current_color_row
    row_index = Board.row_index
    row.each_with_index do |tried_color, tried_color_index|
      if remain_code.include?(tried_color)
        Board.add_key(:white, row_index, tried_color_index)
        remain_code.slice!(remain_code.index(tried_color), 1)
      end
    end
  end
end
