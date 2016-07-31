module Mastermind
    class Game
        attr_reader :board, :status

        COLORS = ['q', 'w', 'e', 'r', 't', 'y']

        def initialize
            @max_turns = 12
            @current_turn = 1
            @board = Board.new
            @status = :continue
            @code = 'qwer'
            puts @code
            @code_counts = count_colors(@code)
        end

        def generate_code
            code = ""
            4.times do
                code << COLORS[rand(6)]
            end
            code
        end

        def count_colors colors
            counts = Hash.new(0)
            colors.each_char do |color|
                counts[counts] += 1
            end

            counts
        end

        def make_guess guess
            pegs = determine_pegs(guess)
            @board.update_board(guess, pegs)
            @status = check_win_conditions(guess)
            @current_turn += 1
        end

        def determine_pegs guess
            guess_counts = count_colors(guess)
            pegs = ''
            guess.split('').each_with_index do |color, i|
                if color == color[i]
                    pegs << "o"
                    guess_counts[color] -= 1
                end
            end

            guess_counts.each do |color, number|
                ([number, @code_counts[color]].min).times do
                    pegs << '.'
                end
            end

            pegs
        end

        def check_win_conditions guess
            if guess == @code
                :won
            elsif @current_turn== @max_turns
                :lost
            else
                :continue
            end
        end


        def force_quit
            @status = :ended
        end
    end

    class Board
        def initialize
            @code = '????'
            @board = Array.new(12, {guess: '....', pegs: '    '})
            @max_turns = 12
            @turn = 0
        end

        def update_board guess, pegs
            @board[@turn]['guess'] = guess
            @board[@turn]['pegs'] = pegs
            @turn += 1
        end
    end
end
