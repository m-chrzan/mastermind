#!/bin/ruby
require './mastermind'
include Mastermind

def next_guess game
    guess = STDIN.gets

    if guess.nil?
        game.force_quit
        return
    end

    guess = guess.chomp.downcase

    case guess
    when /^[qwerty]{#{game.pegs}}$/
        game.make_guess(guess)
    else
        puts "Invalid guess."
        puts "Try again."
    end
end

max_turns = (ARGV[0] || 12).to_i
pegs = (ARGV[1] || 4).to_i

if max_turns <= 0 || pegs <= 0
    raise "Number of turns and pegs must be positive"
end

game = Game.new(max_turns: max_turns, pegs: pegs)

loop do
    break if game.status != :continue
    
    puts game.board
    print "Your guess: "

    next_guess game
end

puts game.board
puts "You #{game.status}!"
