class Pawn < Piece
  def initialize(color, pos, board)
    super
    @picture = color == "black" ? "♟" : "♙"
  end

  def moves
    row_diff = @color == "white" ? -1 : 1

    forward_moves(row_diff) + diagonal_moves(row_diff)
  end

  def forward_moves(row_diff)
    forward_moves = []

    single_step = [@pos[0] + row_diff, @pos[1]]
    double_step = [@pos[0] + row_diff * 2, @pos[1]]

    forward_moves << single_step if @board.on_board?(single_step)
    forward_moves << double_step if still_at_home? && @board.piece_at(double_step).nil?

    forward_moves.select do |pos|
      @board.piece_at(single_step).nil?
    end
  end

  def still_at_home?
    start_row = @color == "black" ? 1 : 6
    start_row == @pos[0]
  end

  def diagonal_moves(row_diff)
    diagonals = [[@pos[0] + row_diff, @pos[1] + 1], [@pos[0] + row_diff, @pos[1] - 1]]
    diagonals.select do |pos|
      @board.on_board?(pos) && other_team(pos)
    end
  end

end
