module NinetyNine
  class Solver
    def initialize(cards, board)
      @cards = cards
      @board = board
    end

    def solve
      # Track the minimum difference
      # Format:[<card>, <pos>, <diff>]
      min = [-1, nil, 100]

      @cards.each do |card|
        @board.each do |pos, stack|
          # Skip invalid
          if pos[0] == 'u' && card < stack.last ||
              pos[0] == 'd' && card > stack.last
            next
          end

          diff = (card - stack.last).abs
          current_diff = min[2]

          if diff < current_diff
            min = [card, pos, diff]

          elsif diff == current_diff
            current_pos = min[1]

            if !current_pos ||
                (current_pos && variance[pos] > variance[current_pos])

              min = [card, pos, diff]
            end
          end
        end
      end

      min
    end

    private

    def variance
      @variance ||=
        @board.map.each do |pos, stack|
          diff = pos[0] == 'u' ? (stack.last - 1) : (100 - stack.last)
          [pos, diff]
        end.to_h
    end
  end
end
