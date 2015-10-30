class Board
  attr_reader :grid
  def initialize size = 10
    @grid = Array.new(size) {Array.new(size) {Tile.new}}
  end

  def render
    @grid.each do |row|
      p row.map(&:face_value)
    end
  end

  def [] (row, column)
    @grid[row][column]
  end

  def []=(row, column, value)
    @grid[row][column] = value
  end

  def valid_move? move
    return false if self[move].nil?
    true
  end

  def over?

  end

end
