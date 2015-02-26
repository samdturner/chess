require_relative 'piece.rb'
require 'byebug'

class SlidingPiece < Piece
  DIRS = {
    :diagonal => [[-1, -1], [-1, 1], [1, -1], [1, 1]],
    :orthogonal => [[1, 0], [0, 1], [-1, 0], [0, -1]]
  }

  def initialize(color, pos, board)
    super
  end

  def moves # should return an array of places a Piece can move to.
    all_possible_moves = []

    move_dirs.each do |dir|
      DIRS[dir].each do |offset|
        i = 1
        x = @pos[0] + offset[0]
        y = @pos[1] + offset[1]
        # debugger
        while @board.on_board?([x, y])
          break if my_teammate([x, y])
          all_possible_moves << [x, y] #unless @pos == [x, y]
          break if other_team([x, y])

          i += 1
          x = @pos[0] + (offset[0] * i)
          y = @pos[1] + (offset[1] * i)
        end
      end
    end

    all_possible_moves
  end

  # def moves # should return an array of places a Piece can move to.
  #   raise "Not implemented"
  # end
end

class Bishop < SlidingPiece
  def initialize(color, pos, board)
    super
    @picture = color == "black" ? "♝" : "♗"
  end

  def move_dirs
    [:diagonal]
  end

end

class Rook < SlidingPiece
  def initialize(color, pos, board)
    super
    @picture = color == "black" ? "♜" : "♖"
  end

  def move_dirs
    [:orthogonal]
  end
end

class Queen < SlidingPiece
  def initialize(color, pos, board)
    super
    @picture = color == "black" ? "♛" : "♕"
  end

  def move_dirs
    [:orthogonal, :diagonal]
  end

end
