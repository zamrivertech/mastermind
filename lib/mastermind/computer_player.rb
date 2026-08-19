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

    # %i[white black red white]
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
      next unless tried_color == code[tried_color_index] && tried_color_index == code.index(tried_color)

      # p "tried color #{tried_color} at #{tried_color_index} == #{code[tried_color_index]} at #{code.index(tried_color)}"
      Board.add_key(:black, row_index, tried_color_index)
      # p "so add black #{Board.current_key_row}"
      #  p "so need to remove #{tried_color} in #{remain_code}"
      remain_code.slice!(remain_code.index(tried_color), 1)
      #  p "remained code #{remain_code}"
    end
    remain_code
  end

  # add white key peg feedback
  def white_feedback(remain_code)
    row = Board.current_color_row
    row_index = Board.row_index
    row.each_with_index do |tried_color, tried_color_index|
      # p '---------------------------------------'
      # p 'white feedback'
      # p remain_code
      next unless remain_code.include?(tried_color)

      # p "remain code has tried color #{tried_color}"
      # p Board.current_key_row
      Board.add_key(:white, row_index, tried_color_index)
      # p "Add white #{Board.current_key_row}"
      remain_code.slice!(remain_code.index(tried_color), 1)
      # p remain_code
      Board.current_key_row.shuffle! if remain_code.empty?
    end
  end

  def add_color(guess)
    Board.add_complete_colors(guess)
  end
end
