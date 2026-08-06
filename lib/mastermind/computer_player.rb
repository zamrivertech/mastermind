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

  # remake this method
  def key_feedback(code)
    return unless codemaker?

    black_feedback(code)
    white_feedback(code)
  end

  # add black key peg feedback
  def black_feedback(code)
    color_row = Board.current_color_row
    color_row_index = Board.current_color_row_index
    i = 0
    while i < 4
      Board.add_key(:black, color_row_index, i) if color_row[i] == code[i]
      break if i >= 4

      i += 1
    end
  end

  # add white key peg feedback
  def white_feedback(code)
    key_row = Board.current_key_row
    color_row = Board.current_color_row
    color_row_index = Board.current_color_row_index
    i = 0
    while i < 4
      p key_row
      Board.add_key(:white, color_row_index, i) if code.include?(color_row[i]) && key_row[i].nil?
      break if i >= 4

      i += 1
    end
  end
end
