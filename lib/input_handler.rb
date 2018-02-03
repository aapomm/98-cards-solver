module NinetyNine
  class InputHandler
    def initialize(cards)
      @cards = cards
    end

    # We use << here to update the reference instead of value
    def initial_cards
      (@cards << cards_input).flatten!
    end

    def move(board)
      print "Move: "
      num, pos = gets.chomp.split(' ')
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
