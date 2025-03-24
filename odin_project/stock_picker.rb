# frozen_string_literal: true
require 'benchmark'

def stock_picker(stock_prices)
  best_buy_sell_days = []
  return nil if stock_prices.empty? || stock_prices == stock_prices.sort.reverse
  return best_buy_sell_days[0, 2] = 0, 2 if stock_prices == stock_prices.sort

  profit = 0
  stock_prices.each_with_index do |buy, b_index|
    next if buy > stock_prices.fetch(b_index + 1, 0)

    (b_index + 1...stock_prices.length).each do |s_index|
      sell = stock_prices[s_index]
      next if buy >= sell

      current_profit = sell - buy
      if current_profit > profit
        profit = current_profit
        best_buy_sell_days[0] = b_index
        best_buy_sell_days[1] = s_index
      end
      next
    end
  end
  best_buy_sell_days
end

stock_prices = Array.new(10_000) { rand(1..1000) }

time = Benchmark.measure do
  stock_picker(stock_prices)
end

puts time
