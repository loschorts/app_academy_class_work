class Card
  attr_accessor :face_value, :face_up


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

end

class Board
end

class Game
end
