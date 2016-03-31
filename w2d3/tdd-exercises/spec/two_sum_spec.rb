require 'rspec'
require_relative '../lib/two_sum.rb'

describe "Array#two_sum method" do
  let(:no_sums) {[1,2,3,4,-5,6]}
  let(:has_sums) {[-1,1,-2,2,0,0]}
  let(:result) {has_sums.two_sum}
  it "returns [] if no positions sum to zero" do
    expect(no_sums.two_sum).to be_empty
  end
  it "finds all pairs of positions that sum to zero" do
    expected = [[0,1], [2,3], [4,5]]
    expect(has_sums.two_sum).to eq(expected)
  end
  it "returns array of pairs of indices" do
    expect(result).to be_an(Array)
    expect(result.all? { |el| el.is_a?(Array) }).to be true
  end

  it "returns arrays sorted by index" do
    expect(result).to eq(result.sort)
  end

  it "returns arrays sorted dictionary-wise" do
    dictionary_result = [[0,6],[1,5],[3,7]]
    array_example = [6,-1,2,3,4,1,-6,-3,8]
    expect(array_example.two_sum).to eq(dictionary_result)
  end

  it "raise error if any element is not a number" do
    bad_array = Proc.new {["a", :symbol].two_sum}
    expect(bad_array).to raise_error
  end

end
