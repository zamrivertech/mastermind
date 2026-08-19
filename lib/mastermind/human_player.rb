# handle human player logic
class HumanPlayer
  include Player

  # add color as human code breaker into board color pegs
  def add_color
    return unless codebreaker?

    user_choice = Input.color_position.split('')
    Board.add_color(Peg.color(user_choice[0]), Board.row_index, user_choice[1].to_i - 1)
  end

  # create secret code as human code maker
  def make_code
    return unless codemaker?

    code = [nil, nil, nil, nil]
    while code.count(nil).positive?
      Output.create_code_ui(code)
      user_choice = Input.color_position.split('')
      code[user_choice[1].to_i - 1] = Peg.color(user_choice[0])
    end
    code
  end

  def feedback # rubocop:disable Metrics/AbcSize
    return unless codemaker? && Board.current_color_row_full?

    feedback = Input.feedback
    black = feedback.slice(0..2).split
    white = feedback.slice(3..5).split

    Board.add_key(Peg.color(black[0]), Board.row_index, black[1])
    Board.add_key(Peg.color(black[0]), Board.row_index, black[2])
    Board.add_key(Peg.color(white[0]), Board.row_index, white[1])
    Board.add_key(Peg.color(white[0]), Board.row_index, white[2])
  end
end
