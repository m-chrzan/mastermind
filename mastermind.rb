module Mastermind
    class Game
        attr_reader :board, :status

        def make_guess guess
        end

        def force_quit
            @status = :ended
        end
    end
end
