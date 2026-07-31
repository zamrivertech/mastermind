# handle game flow and logic
class Game < Interaction
  intro
  human_player = HumanPlayer.new(maker_or_breaker)
  computer_player = ComputerPlayer.new(human_player.role?)
  code = computer_player.make_code

  announce_roles(human_player, computer_player)
  board = Board.new(4, 4)
  human_player.add_color(board, code, computer_player)
  display_board(board)
end
