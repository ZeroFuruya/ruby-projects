require_relative 'gamerules/gamerule'
require_relative 'gamerules/board'
require_relative 'gamerules/scoreboard'
require_relative 'gamerules/symbol_picker'

require_relative 'player/player'

class TicTacToe
  def initialize(board, scoreboard, player_one, player_two)
    @board = board
    @scoreboard = scoreboard
    @player_one = player_one
    @player_two = player_two
  end

  def start_game
    @board.show_game_number
    @board.display_board
    @board.show_stats
  end
end

# User Inputs to be implemented
# symbol_picker user prompt: Type 1 for ⭕️, Type 2 for ❌
# score_board should also show each player's current symbol
player_one_symbol = '⭕️'
player_one = Player.new("Draischaizen", 0, player_one_symbol)
player_two_symbol = SymbolPicker.pick_symbol(player_one_symbol)
player_two = Player.new("Yasuriuan", 0, player_two_symbol)

game_number = 0
scoreboard = Scoreboard.new(player_one, player_two)
board = Board.new(player_one, scoreboard, game_number + 1)

new_game = TicTacToe.new(board, scoreboard, player_one, player_two)

new_game.start_game