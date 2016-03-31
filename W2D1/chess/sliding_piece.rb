require_relative 'piece.rb'

class SlidingPiece < Piece

  def valid?(destination)
    super && board.line_clear?(position, destination)
  end

  def line_clear?(start_pos, end_pos)
    start_row, start_column = start_pos
    end_row, end_column = end_pos

    if start_row == end_row
      squares_between = @grid[start_row][start_column+1...end_column]
    elsif start_col == end_col
      squares_between = @grid[start_column][start_row+1...end_row]
    elsif (start_row - end_row).abs == (start_column - end_column).abs
      row_delta = start_row - end_row
      col_delta = start_column - end_column
      if row_delta < 0
    else
      raise 'not a line'
    end


    squares_between.all? {|piece| piece.nil?}
  end




end
