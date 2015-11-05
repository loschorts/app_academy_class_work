require 'rspec'
require_relative '../lib/my_uniq.rb'

describe "Array#my_uniq" do
  let(:original) {[1,1,2,2,3,3]}
  let(:array_of_arrays) {[[1,2,3], [1,3,4],[4,5,6]]}
  let(:uniqs_of_original) {[1,2,3]}
  let(:with_block) {array_of_arrays.my_uniq {|el| el.first}}

  it "removes duplicates" do
    expect(original.my_uniq).to eq(uniqs_of_original)
  end

  it "doesn't modify the original" do
    original.my_uniq
    expect(original).to be(original)
  end

  it "does not accept parameters other than a block" do
    with_parameters = Proc.new {original.my_uniq(2)}

    expect(with_parameters).to raise_error(ArgumentError)
  end


  context "mirrors the regular uniq" do
    it "uses a block if given" do
      with_block = array_of_arrays.my_uniq {|el| el.first}
      expect(with_block).to eq([[1,2,3],[4,5,6]])
    end

    it "raises error if element and block aren't compatible" do
      bad_block = Proc.new {original.my_uniq {|el| el.first}}
      expect(bad_block).to raise_error(NoMethodError)
    end

    it "returns the same value as Array#uniq" do
      expect(original.my_uniq).to eq(original.uniq)
    end

    it "returns the same value as Array#uniq when given a block" do
      with_block = array_of_arrays.my_uniq {|el| el.first}
      uniq_with_block = array_of_arrays.uniq {|el| el.first}
      expect(with_block).to eq(uniq_with_block)
    end
  end





end
