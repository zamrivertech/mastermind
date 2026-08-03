# handle game flow and logic
class Game
  Output.intro
  human_player = HumanPlayer.new(Input.maker_or_breaker)
  computer_player = ComputerPlayer.new(human_player.role?)
  human_player.add_color
  display_board
end
