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

  def key_feedback(code)
    i = 0
    Board.previous_color_row.each do |tried_color|
      if code.include?(tried_color) &&
         Board.previous_color_row.index(tried_color) == code.index(tried_color)
        Board.add_key(:black, Board.previous_color_row_index, i)
      end
      i += 1
    end
  end
end
