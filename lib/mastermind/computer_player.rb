# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player

  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.random_color, Peg.random_color, Peg.random_color, Peg.random_color]
  end

  def feedback(code)
    white_feedback(black_feedback(code)) if Board.previous_color_row_full?
  end

  # add black key peg feedback
  def black_feedback(code)
    remain_code = code.dup
    row = Board.last_color_row_full? ? Board.current_color_row : Board.previous_color_row
    row_index = Board.last_color_row_full? ? Board.current_color_row_index : Board.previous_color_row_index
    row.each_with_index do |tried_color, tried_color_index|
      if tried_color == code[tried_color_index]
        Board.add_key(:black, row_index)
        remain_code.slice!(remain_code.index(tried_color), 1)
      end
    end
    remain_code
  end

  # add white key peg feedback
  def white_feedback(remain_code)
    row = Board.last_color_row_full? ? Board.current_color_row : Board.previous_color_row
    row_index = Board.last_color_row_full? ? Board.current_color_row_index : Board.previous_color_row_index
    row.each_with_index do |tried_color, tried_color_index|
      if remain_code.include?(tried_color) && Board.previous_key_row[tried_color_index].nil?
        Board.add_key(:white, row_index)
        remain_code.slice!(remain_code.index(tried_color), 1)
      end
    end
  end

  def shuffle_keys
    # if last color row is full shuffle current
    if Board.last_color_row_full?
      Board.current_key_row.shuffle!
    elsif Board.previous_color_row_full?
      Board.previous_key_row.shuffle!
      # if previous color row is full shuffle previous
    end
  end
end
