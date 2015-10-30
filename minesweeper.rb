load './board.rb'
load './tile.rb'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    take_turn until board.over?
  end

  def take_turn
    board.render
    get_input
    evaluate

  end

  # def over?
  #
  # end

  def get_input
    puts "enter your move (x,y)"
    @move = gets.chomp.split(",").map(&:to_i)
  end

  def evaluate
    if board.valid_move?(@move)
      board.process_move(@move)
    else
      puts "invalid move"
    end
  end
end

def reload
  load __FILE__
end
