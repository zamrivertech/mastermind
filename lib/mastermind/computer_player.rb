# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player
  # check human role and be the opposite

  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.random_color, Peg.random_color, Peg.random_color, Peg.random_color]
  end

  # add black key peg feedback
  def black_feedback(code)
    remain_code = code.dup
    Board.previous_color_row.each_with_index do |tried_color, tried_color_index|
      next unless tried_color == code[tried_color_index]

      Board.add_key(:black, Board.previous_color_row_index, tried_color_index)
      remain_code.delete_at(code.index(tried_color))
    end
    white_feedback(code, remain_code)
  end

  # add white key peg feedback
  def white_feedback(code, remain_code)
    Board.previous_color_row.each_with_index do |tried_color, tried_color_index|
      next unless remain_code.include?(tried_color) && Board.previous_key_row[tried_color_index].nil?

      Board.add_key(:white, Board.previous_color_row_index, tried_color_index)
      remain_code.delete_at(code.index(tried_color))
    end
  end
end
