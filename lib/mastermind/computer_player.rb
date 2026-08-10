# handles being the code maker or breaker opposite as human player
class ComputerPlayer
  include Player
  # get secret code by computer
  attr_reader :code

  def initialize(human_role)
    @role = human_role == @@roles[0] ? @@roles[1] : @@roles[0]
  end

  # create secret code if code maker
  def make_code
    return unless codemaker?

    [Peg.random_color, Peg.random_color, Peg.random_color, Peg.random_color]
  end

  def get_session_code(code)
    @code = code
  end

  # add black key peg feedback
  def black_feedback
    remain_code = code.dup
    row = Board.last_color_row_full? ? Board.current_color_row : Board.previous_color_row
    row_index = Board.last_color_row_full? ? Board.current_color_row_index : Board.previous_color_row_index
    row.each_with_index do |tried_color, tried_color_index|
      p row
      p tried_color
      p @code[tried_color_index]
      p tried_color == @code[tried_color_index]
      if tried_color == @code[tried_color_index] # rubocop:disable Style/Next
        Board.add_key(:black, row_index, tried_color_index)
        remain_code.slice!(@code.index(tried_color), 1)
        p "remained code for black #{remain_code}"
      end
    end
  end

  # add white key peg feedback
  def white_feedback
    p "remained code for white #{remain_code}"
    row = Board.last_color_row_full? ? Board.current_color_row : Board.previous_color_row
    row_index = Board.last_color_row_full? ? Board.current_color_row_index : Board.previous_color_row_index
    row.each_with_index do |tried_color, tried_color_index|
      next unless remain_code.include?(tried_color) && Board.previous_key_row[tried_color_index].nil?

      Board.add_key(:white, row_index, tried_color_index)
      remain_code.delete_at(@code.index(tried_color))
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
