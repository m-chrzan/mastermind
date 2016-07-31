module Mastermind
    class Game
        attr_reader :board, :status, :pegs

        COLORS = ['q', 'w', 'e', 'r', 't', 'y']

        def initialize max_turns: 12, pegs: 4
            @max_turns = max_turns
            @pegs = pegs
            @current_turn = 1
            @board = Board.new max_turns, pegs
            @status = :continue
            @code = generate_code
            @code_counts = count_colors(@code)
        end

        def generate_code
            code = ""
            @pegs.times do
                code << COLORS[rand(6)]
            end
            code
        end

        def count_colors colors
            counts = Hash.new(0)
            colors.each_char do |color|
                counts[color] += 1
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
            colors_counted = Hash.new(0)
            pegs = ''

            guess.split('').each_with_index do |color, i|
                if color == @code[i]
                    pegs << "o"
                    guess_counts[color] -= 1
                    colors_counted[color] += 1
                end
            end

            guess_counts.each do |color, number|
                ([number, @code_counts[color] - colors_counted[color]].min).times do
                    pegs << '.'
                end
            end

            pegs
        end

        def check_win_conditions guess
            if guess == @code
                board.reveal(@code)
                :won
            elsif @current_turn== @max_turns
                board.reveal(@code)
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
        def initialize max_turns = 12, num_pegs = 4
            @max_turns = max_turns
            @num_pegs = num_pegs
            @code = '?' * @num_pegs
            @board = Array.new(@max_turns, {guess: '.' * @num_pegs, pegs: ''})
            @turn = 0
        end

        def update_board guess, pegs
            @board[@turn] = {:guess => guess, :pegs => pegs}
            @turn += 1
        end

        def reveal code
            @code = code
        end

        def to_s
            string = "|#{@code}| Turn: #{@turn}/#{@max_turns}\n"
            @board.reverse.each do |row|
                string << "|#{row[:guess]}|#{row[:pegs].ljust(@num_pegs)}|\n"
            end

            string
        end
    end
end
