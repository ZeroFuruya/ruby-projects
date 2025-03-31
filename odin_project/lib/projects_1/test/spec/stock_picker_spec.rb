require_relative '../../stock_picker'

RSpec.describe '#stock_picker' do
  it 'returns the best days to buy and sell for max profit' do
    expect(stock_picker([10, 7, 5, 8, 11, 9])).to eq([2, 4])
    expect(stock_picker([3, 8, 2, 5, 7, 10, 1])).to eq([2, 5])
    expect(stock_picker([1, 5, 3, 8, 12, 4, 10])).to eq([0, 4])
    expect(stock_picker([6, 1, 3, 2, 8, 4, 10])).to eq([1, 6])
  end

  it 'returns nil or an empty array when no profit can be made' do
    expect(stock_picker([9, 7, 5, 3, 1])).to eq(nil) # or []
  end
end
