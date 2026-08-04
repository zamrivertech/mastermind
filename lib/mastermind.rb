require_relative 'mastermind/peg'
require_relative 'mastermind/board'
require_relative 'mastermind/output'
require_relative 'mastermind/input'
require_relative 'mastermind/validate'
require_relative 'mastermind/player'
require_relative 'mastermind/computer_player'
require_relative 'mastermind/human_player'
require_relative 'mastermind/game'

# Mastermind File: Require all files to run game

Game.start
Game.set_players
p Game.human_player
p Game.computer_player
Game.session
