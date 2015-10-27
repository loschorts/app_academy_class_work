class Card
  attr_accessor :face_value, :face_up, :values_dict

  def self.random_card
    Card.new(values_dict.sample)
  end

  def initialize(value)
    @face_value = value
    @face_up = false
  end

  def display
    if face_up
      face_value
    end
    #else- alternative????

  end

  def hide
    face_up = false
  end

  def reveal
    face_up = true
  end

  def to_s
    face_value.to_s
    #revisit here
  end

  def ==(other_card)
    self.face_value == other_card.face_value
  end

  def dup
    Card.new(face_value)
  end


end

class Board
  attr_accessor :grid

  def initialize dimension
    @grid = Array.new(dimension) {Array.new(dimension)}
    populate
  end

  def generate_cards
    cards_needed = grid.length ** 2
    pairs = cards_needed / 2
    cards = []
    pairs.times do
      card1 = Card.random_card
      card2 = card1.dup
      cards << card1 << card2
    end
    cards
  end

  def populate
    cards = generate_cards
    cards.shuffle!

    grid.each do |row|
      row.each do |slot|
        slot = cards.pop
      end
    end
  end

  def render
    grid.each do |row|
      p row
    end
  end

  def won?
    grid.each do |row|
      row.each do |slot|
        return false if !slot.face_up
      end
    end
    true
  end

  def reveal(row, col)
    grid[row][col].reveal
    grid[row][col].face_value
  end


class Game
end
