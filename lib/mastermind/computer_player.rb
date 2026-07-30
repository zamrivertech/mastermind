# ComputerPlayer Class: act as code maker or breaker opposite as human player
class ComputerPlayer
  include Player
  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  def make_code
    return unless codemaker?

    [Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3))]
  end

  def key_feedback(board, secret_code)
    i = 0
    while i < secret_code.length
      if secret_code[i] == board.current_color_row[i]
        board.add_key(:grey, board.current_key_row, i)
      else # index is not the same but the color exists in secret code
        p board.current_key_row
        p i
        board.add_key(:white, board.current_key_row, i)
      end
      i += 1
    end
  end
end
