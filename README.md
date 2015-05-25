# chess
Game of chess built in ruby which can be played in the terminal

Technical challenges:
Challenge was to raise an error if the player made a move that put him in check.  Solved this problem by creating a deep copy of the board object to move the piece and determine if the move is invalid.  The move would only be made on the actual board once it was determined to be valid.  Otherwise, it would raise an error with an informative message alerting the user why the move is invalid.  The user would be asked to move again.

