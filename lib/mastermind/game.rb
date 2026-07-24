# Game Class: Handles Game Flow and Logic
class Game < Interaction
  intro
  human_player = HumanPlayer.new(maker_or_breaker)
  computer_player = ComputerPlayer.new(human_player.role?)

  p 'Human is ' + human_player.role?
  p 'Computer is ' + computer_player.role?
end
