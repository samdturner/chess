require_relative 'piece.rb'

class SteppingPiece < Piece
  def initialize(color, pos, board)
    super
  end

  def moves
    all_possible_moves = []

    move_dirs.each do |offset|
      x = @pos[0] + offset[0]
      y = @pos[1] + offset[1]

      all_possible_moves << [x, y] if @board.on_board?([x, y]) && !my_teammate([x, y])
    end

    all_possible_moves
  end
end

class Knight < SteppingPiece
  KNIGHT_DIRS = [[2, 1], [2, -1], [-2, 1], [-2, -1],
                [1, 2], [1, -2], [-1, 2], [-1, -2]]

  def initialize(color, pos, board)
    super
    @picture = color == "black" ? "♞" : "♘"
  end

  def move_dirs
    KNIGHT_DIRS
  end
end

class King < SteppingPiece
  KING_DIRS =  [[-1, -1], [-1, 1], [1, -1], [1, 1],
                [1, 0], [0, 1], [-1, 0], [0, -1]]

  def initialize(color, pos, board)
    super
    @picture = color == "black" ? "♚" : "♔"
  end

  def move_dirs
    KING_DIRS
  end
end
