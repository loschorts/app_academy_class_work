def stock_picker(arr)
  return [] if arr.empty?

  profit = 0
  best_days = []
  arr.each_with_index do |first_p, idx1|
    arr.each_with_index do |second, idx2|
      next if idx2 <= idx1
      if second - first_p > profit
        profit = second - first_p
        best_days = [idx1, idx2]
      end
    end
  end
  best_days
end
