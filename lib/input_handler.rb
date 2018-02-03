module NinetyNine
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
    # default is of the format of NinetyNine::Solver.solve output
    def move(board, default = [])
      print "Move: "
      num, pos = gets.chomp.split(' ')

      if !num || !pos
        num = default[0]
        pos = default[1].to_s
      end

      board[pos.to_sym] << num.to_i
      @cards.delete(num.to_i)
    end

    def draw
      (@cards << cards_input).flatten!
    end

    private

    def cards_input
      gets.chomp.split(' ').map(&:to_i)
    end
  end
end
