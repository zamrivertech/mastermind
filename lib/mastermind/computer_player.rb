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

    [Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3)), Peg.color(rand(0..3))]
  end

  def key_feedback(code)
    previous_color_row = Board.previous_color_row
    previous_color_row_full = Board.previous_color_row_full?
    return unless previous_color_row_full

    code.each do |code_color|
      previous_color_row.each do |tried_color|
        if previous_color_row.include(code_color)
          if previous_color_row.index(code_color) == code.index(tried_color)
            # black
          else
            # white
          end
        end
      end
    end

    # if color board previous row > 0 and if nil count is zero?
    # compare previous color row with make code
    #
  end
end
