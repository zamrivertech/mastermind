# handle human player logic
class HumanPlayer
  include Player

  # add color as human code breaker into board color pegs
  def add_color(computer, code)
    return unless codebreaker?

    user_choice = Input.get_peg_color.split('')

    Board.add_color(Peg.color(user_choice[0]), Board.current_color_row_index, user_choice[1].to_i - 1)
    computer.key_feedback(code)
  end
end
