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
    black_feedback(code)
  end

  # adds black key peg feedback
  def black_feedback(code)
    row = Board.current_color_row
    row_index = Board.current_color_row_index
    i = 0
    while i < 4
      Board.add_key(:black, row_index, i) if row[i] == code[i]
      break if i >= 4

      i += 1
    end
  end
end
