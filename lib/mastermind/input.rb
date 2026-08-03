# handle text input
class Input
  # get color and position input from human code breaker to enter in board
  def self.get_peg_color(board)
    system 'clear'
    Output.display_valid_colors(Peg.colors)
    puts
    Output.display_board(board)
    puts
    print "Current Row: #{board.current_color_row_index + 1}"
    puts
    Output.last_color_peg_in_row?(board)
    puts
    print 'Choose color and position:'
    gets.chomp
  end

  # ask human code to choose to be code breaker or maker
  def self.maker_or_breaker
    print 'Would you like to be the codemaker(1) or codebreaker(2)?:'
    gets.chomp.to_i
  end
end
