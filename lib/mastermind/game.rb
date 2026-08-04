# handle game flow and logic
class Game
  Output.intro
  human_player = HumanPlayer.new(Input.maker_or_breaker)
  computer_player = ComputerPlayer.new(human_player.role)
  code = computer_player.make_code
  p code
  human_player.add_color(computer_player, code)
  display_board
end
