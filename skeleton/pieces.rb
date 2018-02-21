require_relative 'board.rb'

class Piece

  attr_reader :symbol

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = []
  end

  def moves
    moves = []
    (0..7).each do |row|
      (0..7).each do |col|
        pos = [row, col]
        moves << pos
      end
    end

    moves
  end

  def to_s
    symbol.to_s
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def valid_moves
    moves.reject { |pos| board[pos].color == self.color }
  end

  def pos=(val)
    self = val
  end

  private

  def move_into_check?(end_pos)
    self.move_diffs.any? { |pos| board[pos].is_a?(King) &&
                            self.color != board[pos].color }
  end

end

class Rook < Piece

  def initialize
    super(color, board, pos)
    @symbol = :R
  end
end

class Bishop < Piece

  def initialize
    super(color, board, pos)
    @symbol = :B
  end
end

class Queen < Piece

  def initialize
    super(color, board, pos)
    @symbol = :Q
  end
end

class Knight < Piece

  def initialize
    super(color, board, pos)
    @symbol = :k
  end
end

class King < Piece

  attr_reader :current_pos

  def initialize
    super(color, board, pos)
    @symbol = :K!
    @current_pos = pos
  end

  protected

  def move_diffs
    # current_pos = [0, 4]

    moves = [[1, 0], [1, 1], [0, 1], [-1, 1], [-1, 0], [-1, -1],
             [1, -1], [0, -1]]

    current_row, current_col = current_pos[0], current_pos[-1]

    possible_pos = []
    moves.each do |pos|
      possible_pos << [current_row + pos[0], current_col + pos[-1]]
    end

     possible_pos = possible_pos.select do |pos|
      pos[0].between?(0, 7) && pos[-1].between?(0, 7)
    end
  end
end

class Pawn < Piece

  def initialize
    @symbol = :P
  end
end

class NullPiece < Piece


  include Singleton

  def initialize
    @symbol = :X
  end

end
