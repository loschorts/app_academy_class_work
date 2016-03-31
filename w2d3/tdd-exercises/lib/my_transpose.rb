class Array
  def my_transpose
    return [] if self.empty?
    return self.map {|el| [el]} unless self[0].is_a?(Array)
    result = Array.new(self[0].length) {Array.new(self.length)}
    self.each_with_index do |rows, row_index|
      rows.each_with_index do |el, col_index|
        result[col_index][row_index] = self[row_index][col_index]
      end
    end
    result
  end
end
