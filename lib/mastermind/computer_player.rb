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

  def key_feedback(code) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    i = 0
    row = nil
    row_index = nil
    if Board.last_color_row?
      row = Board.current_color_row
      row_index = Board.current_color_row_index
    else
      row = Board.previous_color_row
      row_index = Board.previous_color_row_index
    end
    row.each do |tried_color|
      if code.include?(tried_color) &&
         row.index(tried_color) == code.index(tried_color)
        Board.add_key(:black, row_index, i)
      end
      if code.include?(tried_color) &&
         row.index(tried_color) != code.index(tried_color)
        Board.add_key(:white, row_index, i)
      end
      i += 1
    end
  end
end
