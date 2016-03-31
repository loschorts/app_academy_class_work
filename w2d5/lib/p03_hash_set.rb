require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if count >= @store.length
      resize!
    end
    @count+=1
    @store[index(key)] << key unless include?(key)
  end

  def include?(key)
    @store[index(key)].include?(key)
  end

  def remove(key)
    @count+=1
    @store[index(key)].delete(key)
  end

  private

  def index(key)
    key.to_s.hash.to_s.to_i(2) % @store.size
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(@store.length * 2) {Array.new}
    @store.reduce(&:+).each do |el|
      index = el % new_array.length
      new_array[index] << el
    end
    @store = new_array

  end
end
