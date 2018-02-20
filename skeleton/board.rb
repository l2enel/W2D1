require 'byebug'

class Board
  def self.make_board
    Array.new(8) { Array.new(8) }
  end

  def initialize(board = Board.make_board)
    @grid = board
    populate
  end

  def[](pos)
    row , col = pos
    @grid[row][col]
  end

  def[]=(pos, piece)
    row , col = pos
    @grid[row][col] = piece
  end

  def move_piece(color, start_pos, end_pos)
    @grid[start_pos], @grid[end_pos] = @grid[end_pos], @grid[start_pos]
    if @grid[start_pos].color != @grid[end_pos].color
      @grid[end_pos], @grid[start_pos] = @grid[start_pos], nil
    end
  end

  def valid_pos?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def add_piece(piece, pos)
    @grid[pos] = piece
  end

  def populate
    debugger
    positions_array = all_positions

    @grid = all_positions.map do |pos|
      if pos[0].even?
        @grid[pos] = Pawn.new
      else
        @grid[pos] = NullPiece.new
      end
    end

  end

  def all_positions
    positions_array = []

    (0..7).each do |row|
      (0..7).each do |col|
        position = [row, col]
        positions_array << position
      end
    end
    positions_array
  end

    # (@grid[1].each do |el|
    #   el = Pawn.new
    # end
    #
    # @grid[6].each do |el|
    #   @grid[el] = Pawn.new
    # end
    #
    # @grid[3].each do |el|
    #   @grid[el] = NullPiece.new
    # end)


end

class Pawn
  def initialize
    @symbol = :P
  end
end

# class Piece
#
# end

class NullPiece
  def initialize
    @symbol = :X
  end
end
