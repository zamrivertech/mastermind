# handle game flow and logic
class Game
  class << self
    attr_reader :human_player, :computer_player
  end

  def self.start
    Output.intro
  end

  def self.set_players
    @human_player = HumanPlayer.new(Input.maker_or_breaker)
    @computer_player = ComputerPlayer.new(human_player.role)
  end

  def self.session
    # Depending on set players
    # Interact only with human depending on role
    # for code maker is human
    code = @computer_player.make_code
    while true
      system 'clear'
      p code
      Output.display_valid_colors
      puts
      Output.display_board
      puts
      print "Current Row: #{Board.current_color_row_index + 1}"
      puts
      Output.last_color_peg_in_row?
      puts
      @human_player.add_color(@computer_player, code)
      puts Output.display_board
      @computer_player.key_feedback(code)
      if Board.previous_color_row == code
        puts 'You win'
        break
      end
      next unless Board.last_color_row != code &&
                  Board.last_color_row? &&
                  Board.last_color_row_full?

      puts 'You lost'
      break
    end
  end
end
