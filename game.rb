#!/bin/ruby
require './mastermind'
include Mastermind

def next_guess game
    guess = gets

    if guess.nil?
        game.force_quit
        return
    end

    guess = guess.chomp.downcase

    case guess
    when /^[qwerty]{4}$/
        game.make_guess(guess)
    else
        puts "Invalid guess."
        puts "Try again."
    end
end

game = Game.new

loop do
    break if game.status == :ended
    
    puts game.board
    print "Your guess: "

    next_guess game
end
