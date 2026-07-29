# Game Class: Handles Game Flow and Logic
class Game < Interaction
  intro
  human_player = HumanPlayer.new(maker_or_breaker)
  computer_player = ComputerPlayer.new(human_player.role?)
  # announce_roles(human_player, computer_player)
  board = Board.new(4, 4)
  human_player.add_color(board)
end
