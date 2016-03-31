class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
    @max = max
  end

  def insert(num)
    validate!(num)
    return false if @store[num]
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[index(num)] << num
  end

  def remove(num)
    @store[index(num)].delete(num)
  end

  def include?(num)
    @store[index(num)].include?(num)
  end

  private

  def index(num)
    index = num % @store.length
  end
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count >= @store.length
      resize!
    end
    index = num % @store.count
    @store[index] << num
    @count += 1
  end

  def remove(num)
    index = num % @store.count
    @store[index].delete(num)
    @count -= 1
  end

  def include?(num)
    index = num % @store.count
    @store[index].include?(num)
  end

  private

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
