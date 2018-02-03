module NinetyEight
  class InputHandler
    def initialize(cards)
      @cards = cards
    end

    def initial_cards
      # We use << here to update the reference instead of value
      (@cards << cards_input).flatten!
    end

    # Perform a move on the board
    # Execute the default arg when the user inputs an empty value 
    # default is of the format of NinetyEight::Solver.solve output
    def move(board, default = [])
      loop do
        print "Move: "
        num, pos = gets.chomp.split(' ')

        if !num || !pos
          num = default[0]
          pos = default[1].to_s
        end

        next if !num || !pos

        board[pos.to_sym] << num.to_i
        @cards.delete(num.to_i)

        break
      end
    end

    def draw
      loop do
        drawn = cards_input
        next if drawn.size < 2

        (@cards << drawn).flatten!
        break
      end
    end

    private

    def cards_input
      gets.chomp.split(' ').map(&:to_i)
    end
  end
end
