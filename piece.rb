class Piece
  attr_reader :color, :picture
  attr_accessor :pos

  def initialize(color, pos, board)
    @color, @pos, @board = color, pos, board
  end

  def moves # should return an array of places a Piece can move to.
    raise "Not implemented"
  end

  def valid_moves
    moves.select { |pos| !move_into_check?(pos) }
  end

  def my_teammate(pos)
    @color == @board.color_of_piece_at(pos)
    # debugger
  end

  def other_team(pos)
    if @color == "black"
      opponent_color = "white"
    else
      opponent_color = "black"
    end

    opponent_color == @board.color_of_piece_at(pos)
  end

  def move_into_check?(pos)
    dup_board = @board.deep_dup

    dup_board.move!(@pos, pos)
    dup_board.in_check?(@color)
  end
end
