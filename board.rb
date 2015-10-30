class Board
  attr_reader :grid
  def initialize size = 10, bombs = 5
    @grid = Array.new(size) {Array.new(size) {Tile.new(self)}}
    seed_bombs(bombs)
    scan_and_set_all_neighbors
  end

  def seed_bombs bombs
    count = 0
    until count == bombs
      spot = @grid.sample.sample
      unless spot.is_bomb
        spot.set_as_bomb
        spot.neighbors.each.value += 1
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

  def valid_pos? pos
    return false if self[pos].nil?
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
        return false unless tile.revealed
      end
    end
    true
  end

  def get_neighbors_of tile
    row, col = find_tile_location tile
    [
      [row-1, col-1],
      [row-1, col],
      [row-1, col+1],
      [row, col-1],
      [row, col+1],
      [row+1, col-1],
      [row+1, col],
      [row+1, col+1],
    ].select{|pos| pos.valid_pos?}
  end

  def find_tile_location tile
    @grid.each_with_index do |_,row|
      row.each_with_index do |other_tile, col|
        return [row, col] if tile == other_tile
      end
    end
    raise 'tile not found!'
  end

end
