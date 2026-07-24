# Game Class: Handles Game Flow and Logic
class Game < Interaction
  intro
  human_player = HumanPlayer.new(maker_or_breaker)

  p human_player.role?
end
