# loop game actions based on set roles for playes
class Session
  attr_reader :computer_player, :human_player

  def initialize(computer_player, human_player)
    @computer_player = computer_player
    @human_player = human_player
  end

  # stop game session if human code player wins or lose
  def human_breaker_computer_maker_winner(code)
    stop = false
    Output.display_human_breaker_computer_maker_ui(@computer_player, @human_player)
    if Board.current_color_row == code
      puts 'Computer Lost, You Won!'.colorize(:green)
      stop = true
    elsif Board.last_color_row_full? && Board.last_color_row != code
      puts 'Computer Won, You Lost!'.colorize(:red)
      stop = true
    end
    stop
  end

  # computer player creates code and
  # human player tries to break it
  def human_breaker_computer_maker
    code = @computer_player.make_code
    loop do
      Output.display_human_breaker_computer_maker_ui(@computer_player, @human_player)
      # p code
      @human_player.add_color
      break if Board.current_color_row_full? && human_breaker_computer_maker_winner(code)

      next unless Board.current_color_row_full? && (Input.confirm_row? == 'y')

      @computer_player.feedback(code)
      Board.next_row
    end
  end

  def human_maker_computer_breaker
    code = @human_player.make_code
    possible_colors = Peg.only_colors
    loop do
      @computer_player.add_color([possible_colors.sample, possible_colors.sample, possible_colors.sample,
                                  possible_colors.sample])
      Output.display_human_maker_computer_breaker_ui(@computer_player, @human_player, code)
      @human_player.feedback
      feedback = Board.current_key_row
      p possible_colors

      # works well for repeated colors
      possible_colors.filter! { |color| !Board.current_color_row.include?(color) } if feedback.count(nil) == 4

      p possible_colors

      break if Board.last_color_row_full?

      Board.next_row if Input.confirm_row? == 'y'
      # computer add color
      # if full, give feedback
      # computer check feedback
      # no need to confirm row
    end
  end
end
