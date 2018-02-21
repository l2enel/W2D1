require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display

  attr_reader :cursor

  def initialize(cursor, board)
    @cursor = cursor
    @board = board
  end

  def display_loop(board)
    i = 0
    while i < 10
      render(board)
      cursor.get_input


      i += 1
    end
  end

  def render(board)
    board.grid.each_with_index do |row, row_i|
      row.each_index do |col_i|
        pos = [row_i, col_i]
        if pos == cursor.cursor_pos
          print board[pos].symbol.to_s.colorize(:green)
        else
          print board[pos].symbol.to_s
        end
      end
      puts
    end
    puts "----------------------------"

    # row_0 = board.grid[0].map { |piece| piece.symbol }
    # row_1 = board.grid[1].map { |piece| piece.symbol }
    # row_2 = board.grid[2].map { |piece| piece.symbol }
    # row_3 = board.grid[3].map { |piece| piece.symbol }
    # row_4 = board.grid[4].map { |piece| piece.symbol }
    # row_5 = board.grid[5].map { |piece| piece.symbol }
    # row_6 = board.grid[6].map { |piece| piece.symbol }
    # row_7 = board.grid[7].map { |piece| piece.symbol }
    #
    # puts row_0.join
    # puts row_1.join
    # puts row_2.join
    # puts row_3.join
    # puts row_4.join
    # puts row_5.join
    # puts row_6.join
    # puts row_7.join
  end

end
