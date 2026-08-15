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

  def self.session_players
    session = Session.new(@computer_player, @human_player)
    if @computer_player.codemaker? && human_player.codebreaker?
      session.human_breaker_computer_maker
    else
      puts 'New Logic Here!'
    end
  end
end
