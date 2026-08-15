# handle game flow and logic
class Game
  # access human and computer players objects
  class << self
    attr_reader :human_player, :computer_player
  end

  # start game with welcome text
  def self.start
    Output.intro
  end

  # set players by human choice
  def self.set_players
    @human_player = HumanPlayer.new(Input.maker_or_breaker)
    @computer_player = ComputerPlayer.new(human_player.role)
  end

  # stop game session if human code player wins or lose
  def self.win_or_lose(code) # rubocop:disable Metrics/MethodLength
    stop = false
    @computer_player.feedback(code)
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
  def self.session
    code = @computer_player.make_code
    loop do
      Output.display_roles(@computer_player, @human_player)
      Output.display_board
      p code
      @human_player.add_color
      break if Board.current_color_row_full? && win_or_lose(code)

      next unless Board.current_color_row_full? && (Input.confirm_row? == 'y')

      @computer_player.feedback(code)
      Board.next_row
    end
  end
end
