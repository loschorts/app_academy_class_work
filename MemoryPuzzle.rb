class Card
  attr_accessor :face_value, :face_up, :values_dict

  @@values_dict = ("A".."Z").to_a

  def self.random_card
    Card.new(@@values_dict.shift)
  end

  def initialize(value)
    @face_value = value
    @face_up = false
  end

  def display
    if @face_up
      @face_value
    else
      "-"
    end
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_value.to_s
  end

  def ==(other_card)
    @face_value == other_card.face_value
  end

  def dup
    Card.new(face_value)
  end


end

class Board
  attr_accessor :grid

  def initialize dimension
    @grid = populate (dimension)
  end

  def generate_cards dim
    cards_needed = dim ** 2
    pairs = cards_needed / 2

    cards = []
    pairs.times do
      card1 = Card.random_card
      card2 = card1.dup
      cards << card1 << card2
    end
    cards
  end

  def populate (dim)
    new_grid = Array.new(dim) {Array.new(dim)}

    cards = generate_cards (dim)
    cards.shuffle!


    new_grid.map do |row|
      row.map do |slot|
        slot = cards.pop
      end
    end
  end

  def render
    grid.each do |row|
      row.each do |slot|
        print slot.display
      end
      puts
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

  def each
    @grid.each do |row|
      row.each do |slot|
        yield slot
      end
    end
  end
end

class Game
  attr_accessor :board, :players

  def initialize *players
    @players = players
    @board = Board.new(4)
  end

  def current_player
    @players.first
  end

  def next_player!
    @players.rotate!
  end

  def play
    #start prompt

    until over
      system("clear")
      puts "#{current_player.name}'s Turn: "
      make_guess
      next_player!
    end

    puts "#{winning.name} won!"

  end

  def winning
    players_by_points = @players.sort_by{|player| -player.points}
    players_by_points.first
  end

  def render
    @board.render
  end

  def prompt
    row, col = -1, -1

    until valid_guess(row, col)
      row, col = current_player.get_prompt @board
    end

    @board.grid[row][col]
  end

  def valid_guess row, col
    return false if (0...@board.grid.length).include?(row)
    return false if (0...@board.grid.length).include?(col)
    return !@board.grid[row][col].face_up
  end


  def over
    @board.won?
  end


  def make_guess
    render
    guess1 = prompt
    guess1.reveal

    render
    guess2 = prompt
    guess2.reveal


    #match
    unless guess1 == guess2
      render
      puts "you missed"
      guess1.hide
      guess2.hide
    else
      player.add_match
    end
    gets
    system("clear")
  end

end

class Player
  attr_accessor :name, :points
  def initialize
    @name = name
    @points = 0
  end

  def get_prompt board
    print "enter guess (row, col): "
    row, col = gets.chomp.split(",").map(&:strip).map(&:to_i)
  end

  def add_match
    @points += 1
  end
end

class ComputerPlayer < Player
end
