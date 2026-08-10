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

  def self.win_or_lose(code)
    stop = false
    Output.display_board
    if Board.previous_color_row == code ||
       Board.current_color_row == code
      puts 'You win'
      stop = true
    elsif Board.last_color_row_full? &&
          Board.last_color_row != code
      puts 'You lost'
      stop = true
    end
    stop
  end

  def self.session
    code = @computer_player.make_code
    @computer_player.get_session_code(code)
    p @computer_player.code
    loop do
      Output.display_board
      @human_player.add_color
      @computer_player.black_feedback
      break if win_or_lose(code)
    end
  end
end
