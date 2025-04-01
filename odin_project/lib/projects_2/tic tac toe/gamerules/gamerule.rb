class GameRule

  attr_accessor :current_player_turn, :scoreboard

  # current_player_turn -> Player class, scoreboard -> [player_one_score, player_two_score] int
  def initialize(current_player_turn, scoreboard)
    @current_player_turn = current_player_turn
    @scoreboard = scoreboard
  end
end