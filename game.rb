#!/bin/ruby
require './mastermind'

def next_guess game
end

game = Game.new

loop do
    break if game.status == :ended
    
    puts game.board
    puts "Your guess: "

    next_guess game
end
