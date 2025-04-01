require_relative 'gamerule'

class Board < GameRule
  attr_accessor :board, :current_player_move, :game_number, :current_board_state

  # current_player_turn -> Player class, current_player_move -> coordinate [x, y] int , current_board_state -> matrix
  # scoreboard -> Scoreboard class
  def initialize(current_player_turn, scoreboard, game_number = 0, current_player_move = [0, 0], current_board_state = Array.new(3) { Array.new(3, '⬜️') })
    super(current_player_turn, scoreboard)
    @game_number = game_number
    @board = current_board_state
    @current_player_move = current_player_move
  end

  def display_board
    @board.each do |row|
      puts row.join('')
    end
  end

  def show_game_number
    puts "Game No. #{game_number}"
  end

  def show_stats
    puts "Player #{current_player_turn.player_name}'s #{current_player_turn.current_symbol} turn"
    scoreboard.show_scores
  end
end
