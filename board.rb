class Board
  attr_reader :grid
  def initialize size = 10, bombs = 5
    @grid = Array.new(size) {Array.new(size) {Tile.new}}
    #seed_bombs(bombs)
  end

  def seed_bombs bombs
    count = 0
    until count == bombs
      spot = @grid.sample.sample
      unless spot.is_bomb
        spot.is_bomb = true
      end
      count += 1
    end
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

  def each &prc
    @grid.each do |row|
      row.each do |el|
        prc.call(el)
      end
    end
  end

  def every_bomb_flagged?

  end

  def every_non_bomb_revealed?
    each do |tile|
      unless tile.is_bomb
        return false unless tile.revealed?
      end
    end
    true
  end

end
