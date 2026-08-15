# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player

  # set opposite role by human role choice
  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.random_color, Peg.random_color, Peg.random_color, Peg.random_color]
  end

  # add key feedback in key row if current color row is full
  def feedback(code)
    return unless codemaker? && Board.current_color_row_full?

    white_feedback(black_feedback(code))
  end

  # add black key peg feedback
  def black_feedback(code)
    remain_code = code.dup
    row = Board.current_color_row
    row_index = Board.row_index
    row.each_with_index do |tried_color, tried_color_index|
      if tried_color == code[tried_color_index] && tried_color_index == code.index(tried_color)
        Board.add_key(:black, row_index)
        remain_code.slice!(remain_code.index(tried_color), 1)
      end
    end
    remain_code
  end

  # add white key peg feedback
  def white_feedback(remain_code)
    row = Board.current_color_row
    row_index = Board.row_index
    row.each do |tried_color|
      if remain_code.include?(tried_color)
        Board.add_key(:white, row_index)
        remain_code.slice!(remain_code.index(tried_color), 1)
      end
    end
  end
end
