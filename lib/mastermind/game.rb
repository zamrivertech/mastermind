# Game Class: Handles Game Flow and Logic
class Game < Interaction
  # intro
  # human_player = HumanPlayer.new(maker_or_breaker)
  # computer_player = ComputerPlayer.new(human_player.role?)
  # announce_roles(human_player, computer_player)
  Board.add_color(Peg.color(1), 0, 0)
  display_valid_colors(Peg.colors)
  display_board(Board.grid)
end
