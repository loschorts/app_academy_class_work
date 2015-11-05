require 'rspec'
require_relative '../lib/my_transpose.rb'

describe "Array#my_transpose" do
  let(:start) {[
    [0,1,2],
    [3,4,5],
    [6,7,8]
    ]}

  let(:expected) {[
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]}
  let(:rectangle) {[
    [0,1,2,3],
    [4,5,6,7]
    ]}
  it 'returns [] if array is empty' do
    expect([].my_transpose).to be_empty
  end
  it 'returns an array with the same number of elements' do
    starting_count = start.flatten.count
    ending_count = start.my_transpose.flatten.count
    expect(starting_count).to eq(ending_count)
  end

  it 'reverses the dimensions' do
    starting_rows = rectangle.count
    starting_cols = rectangle[0].count
    ending_rows = rectangle.my_transpose.count
    ending_cols = rectangle.my_transpose[0].count
    expect(starting_rows).to eq(ending_cols)
    expect(starting_cols).to eq(ending_rows)
  end

  it 'transposes the elements' do
    expect(start.my_transpose).to eq(expected)
  end

  it 'transposes a single row' do
    expect([1,2,3].my_transpose).to eq([[1],[2],[3]])
  end
end
