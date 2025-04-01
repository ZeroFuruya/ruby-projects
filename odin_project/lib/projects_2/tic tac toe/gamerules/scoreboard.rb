class Scoreboard
  attr_accessor :player_one, :player_two

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def show_scores
    puts "Scores: \n    --> #{player_one.player_name}:\t#{player_one.player_score}\n    --> #{player_two.player_name}:\t#{player_two.player_score}"
  end
end
