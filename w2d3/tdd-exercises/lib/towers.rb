require 'byebug'
class Game
  attr_reader :towers

  def initialize
    @towers = [
      [3,2,1],
      [],
      []
      ]
  end
  def play
    #byebug
    until game_over?
      render
      move = get_move
      do_move move
    end
  end
  def get_move
    gets
  end
  def do_move move
    move_disc move if valid?(move)
  end
  def move_disc move
  end
  def game_over?
    true
  end
  def render
  end
  def valid? move
  end

end

p Game.new.instance_variables
