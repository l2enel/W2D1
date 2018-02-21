require 'byebug'
require_relative 'display.rb'
require_relative 'pieces.rb'

class Board
  def self.make_board
    Array.new(8) { Array.new(8) }
  end

  attr_accessor :grid

  def initialize(board = Board.make_board)
    @grid = board
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    raise MoveError if self[start_pos].is_a?(NullPiece)
    raise MoveError unless self[end_pos].is_a?(Piece)

    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
    # if @grid[start_pos].color != @grid[end_pos].color
    #   @grid[end_pos], @grid[start_pos] = @grid[start_pos], nil
    # end
  end

  def valid_pos?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def add_piece(piece, pos)
    @grid[pos] = piece
  end

  def populate

    # positions_array = all_positions

    self.grid.each_with_index do |row, row_idx|
      # debugger
      row.each_index do |col_idx|
        pos = [row_idx, col_idx]
          if row_idx.even?
            self[pos] = NullPiece.new
          else
            self[pos] = Pawn.new
          end
      end
    end

  # def render
  #   row_0 = self.grid[0].map { |piece| piece.symbol }
  #   row_1 = self.grid[1].map { |piece| piece.symbol }
  #   row_2 = self.grid[2].map { |piece| piece.symbol }
  #   row_3 = self.grid[3].map { |piece| piece.symbol }
  #   row_4 = self.grid[4].map { |piece| piece.symbol }
  #   row_5 = self.grid[5].map { |piece| piece.symbol }
  #   row_6 = self.grid[6].map { |piece| piece.symbol }
  #   row_7 = self.grid[7].map { |piece| piece.symbol }
  #
  #   puts row_0.join
  #   puts row_1.join
  #   puts row_2.join
  #   puts row_3.join
  #   puts row_4.join
  #   puts row_5.join
  #   puts row_6.join
  #   puts row_7.join
  # end

    def inspect
    end

  end

  # def all_positions
  #   positions_array = []
  #
  #   (0..7).each do |row|
  #     (0..7).each do |col|
  #       position = [row, col]
  #       positions_array << position
  #     end
  #   end
  #   positions_array
  # end

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

class MoveError < StandardError
end

class Piece

  attr_reader :symbol

end

class Pawn < Piece



  def initialize
    @symbol = :P
  end
end

class NullPiece < Piece



  def initialize
    @symbol = :X
  end
end
