class Player
  attr_accessor :player_name, :player_score, :current_symbol

  # player_name -> string, player_score -> int, current_symbol = '⭕️' or '✖️'
  def initialize(player_name, player_score, current_symbol = '⭕️')
    @player_name = player_name
    @player_score = player_score
    @current_symbol = current_symbol
  end

  def to_s
    "#{@player_name} (Score: #{@player_score}, Symbol: #{@current_symbol})"
  end
end
