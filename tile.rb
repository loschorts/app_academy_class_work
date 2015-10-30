class Tile
  attr_accessor :is_bomb, :revealed
  def initialize value = nil, board
    @board = board
    @value = value
    @is_bomb = false
    @revealed = false
    @neighbors = []
  end

  def set_as_bomb
    @is_bomb = true
  end

  def reveal
    @revealed = true
  end

  def list_of_neighbors
    @neighbors = board.get_neighbors self
  end

  def neighbor_bomb_count
    @neighbors.select{|neighbor| neighbor.is_bomb}.count
  end
  def inspect
    face_value
  end
  def face_value
    @revealed ? @value : "+"
  end
end
