class SymbolPicker
  def self.pick_symbol(player_one_symbol)
    # If Player 1 chooses '⭕️', then Player 2 will get '❌' and vice versa.
    player_one_symbol == '⭕️' ? '❌' : '⭕️'
  end
end
