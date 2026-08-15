# handle human player logic
class HumanPlayer
  include Player

  # add color as human code breaker into board color pegs
  def add_color
    return unless codebreaker?

    user_choice = Input.color_position.split('')
    Board.add_color(Peg.color(user_choice[0]), Board.row_index, user_choice[1].to_i - 1)
  end

  def make_code
    return unless codemaker?

    code = [nil, nil, nil, nil]
    while code.count(nil).positive?
      system 'clear'
      print 'Create a code for computer to break...'
      puts
      Output.display_valid_colors
      puts
      Output.display_code(code)
      puts
      puts
      user_choice = Input.color_position.split('')
      code[user_choice[1].to_i - 1] = Peg.color(user_choice[0])
    end
    code
  end
end
