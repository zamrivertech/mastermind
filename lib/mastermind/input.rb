# handle text input
class Input
  # get color and position input from human code breaker to enter in board
  def self.get_peg_color(board)
    system 'clear'
    display_valid_colors(Peg.colors)
    puts
    display_board(board)
    puts
    print "Current Row: #{board.current_color_row_index + 1}"
    puts
    print 'Choose color and position:'
    gets.chomp
  end
end
