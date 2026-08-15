# loop game actions based on set roles for playes
class Session
  attr_reader :computer_player, :human_player

  def initialize(computer_player, human_player)
    @computer_player = computer_player
    @human_player = human_player
  end

  # stop game session if human code player wins or lose
  def human_codebreaker_win_or_lose(code)
    stop = false
    Output.display_board
    if Board.current_color_row == code
      puts 'You win'
      stop = true
    elsif Board.last_color_row_full? && Board.last_color_row != code
      puts 'You lost'
      stop = true
    end
    stop
  end

  # computer code maker create code
  # display board so human code breaker tries to break code
  def human_breaker_computer_maker
    code = @computer_player.make_code
    loop do
      Output.display_roles(@computer_player, @human_player)
      Output.display_board
      # p code
      @human_player.add_color
      break if Board.current_color_row_full? && human_codebreaker_win_or_lose(code)

      next unless Board.current_color_row_full? && (Input.confirm_row? == 'y')

      @computer_player.feedback(code)
      Board.next_row
    end
  end
end
