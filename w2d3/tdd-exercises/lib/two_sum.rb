class Array
  def two_sum
    # return []
    result = []
    self.each_index do |i1|
      (i1...self.length).each do |i2|
        next unless i2 > i1
        solution = [i1, i2]
        result << solution if self[i1] + self[i2] == 0
      end
    end
    result
  end
end
