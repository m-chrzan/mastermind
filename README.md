# Mastermind

[Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) for the command-line interface.


Run `./game.rb [max turns [number of pegs]]` to start the game.

By default, you have 12 turns to guess a 4-peg code, composed of the letters "qwerty"
(duplicates allowed). 

The first column displays your guesses, in the second column, key pegs are
placed after each guess. Colored pegs are represented with `o`s, white pegs with
`.`s. 

    $ ./game.rb 
    |????| Turn: 0/12
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    Your guess: _

    ...

    Your guess: wqqe
    |wqqe| Turn: 6/12
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |....|    |
    |wqqe|oooo|
    |qweq|....|
    |qeqw|o...|
    |qwqe|oo..|
    |qqww|o.. |
    |qqqq|oo  |
    You won!
