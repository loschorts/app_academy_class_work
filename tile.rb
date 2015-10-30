class Tile
  def initialize

  end

  def reveal

  end

  def neighbors

  end

  def neighbor_bomb_count

  end
  def inspect
    "+"
  end
  def face_value
    return "*" if condition
    return "_" if condition
  end
end
