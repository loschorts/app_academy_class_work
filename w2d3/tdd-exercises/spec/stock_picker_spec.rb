require 'rspec'
require_relative '../lib/stock_picker.rb'

describe "stock_picker" do
  let(:stock_prices) { [5,7,2,6,1,9,3] }

  it "returns empty if array is empty" do
    expect(stock_picker([])).to eq([])
  end

  it "returns array of count 2" do
    expect(stock_picker(stock_prices).length).to eq(2)
  end
  it "returns the best days for buying then selling stock" do
    expect(stock_picker(stock_prices)).to eq([4,5])
  end

end
