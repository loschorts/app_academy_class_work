class Board

  def initialize

  end

  def render

  end

  def [] (row, column)
    @grid[row][column]
  end

  def []=(row, column, value)
    @grid[row][column] = value
  end

  def valid_move?

  end


end
