# chess
Game of chess built in ruby which can be played in the terminal

###Technical Challenges:
Challenge was to raise an error when the player made a move that would leave the him in check. Solution was to write a Piece#move_into_check?(pos) method that:

1. Duplicates the Board and perform the move.
2. Determines if the player is in check after the move (Board#in_check?).

Wrote a custom #deep_dup method that makes a deep copy of the board and it's pieces represented as instance variables. Your #dup method should duplicate not only the Board, but the pieces on the Board.

```
# board.rb

  def move(start_pos, end_pos, player_color)
    piece = piece_at(start_pos)

    no_piece_error = ArgumentError.new "You don't have a piece there"
    wrong_color_error = ArgumentError.new "This is not your piece!"
    invalid_move_error = ArgumentError.new "You can't move there!"
    check_error = ArgumentError.new "That move move would put you in check"

    raise no_piece_error if piece.nil?
    raise wrong_color_error unless player_color == piece.color
    raise invalid_move_error unless piece.moves.include?(end_pos)
    raise check_error unless piece.valid_moves.include?(end_pos)

    move!(start_pos, end_pos)
  end
  
  def move!(start_pos, end_pos)
    piece = piece_at(start_pos)
    self[start_pos[0], start_pos[1]] = nil
    self[end_pos[0], end_pos[1]] = piece
    piece.pos = end_pos
  end

  def deep_dup
    new_board = Board.new(true)
    all_pieces = find_team("white") + find_team("black")
    all_pieces.each do |piece|
      x = piece.pos[0]
      y = piece.pos[1]
      new_board[x,y] = piece.class.new(piece.color, piece.pos, new_board)
    end

    new_board
  end
```

```
# piece.rb

  def move_into_check?(pos)
    dup_board = @board.deep_dup

    dup_board.move!(@pos, pos)
    dup_board.in_check?(@color)
  end
```
