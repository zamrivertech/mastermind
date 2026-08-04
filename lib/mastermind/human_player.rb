# handle human player logic
class HumanPlayer
  include Player

  # add color as human code breaker into board color pegs
  def add_color
    return unless codebreaker?

    while Board.current_color_row_index != -1
      user_choice = Input.get_peg_color.split('')

      Board.add_color(Peg.color(user_choice[0]), Board.current_color_row_index, user_choice[1].to_i - 1)
      # if coderbeaker is sure and would like to move on...
      # ...to next row, confirm yes or no
      # if yes, close current row, get key peg result...
      # and move on, if not
      # delete last added color or delete all, add this options
    end
  end
end
