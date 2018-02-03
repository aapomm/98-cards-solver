#!/usr/bin/env ruby

require './lib/input_handler.rb'
require './lib/solver.rb'

# Board
board = {
  u0: [1],
  u1: [1],
  d0: [100],
  d1: [100]
}

# Available cards
cards = []
i_handler = NinetyNine::InputHandler.new(cards)

# Initial cards
# Input: card numbers separated by space
# Ex: 3 56 7 88 10 23 49 44
print 'Input initial cards: '
i_handler.initial_cards

solver = NinetyNine::Solver.new(cards, board)

loop do
  # Solve and answer
  print "Answer: "
  ans = solver.solve
  puts "Move #{ans[0]} to #{ans[1]} (diff: #{ans[2]})"

  puts 'Input move'
  # Add to the board
  # Input: <card> <u/d><0/1>
  # Ex: 3 u0
  i_handler.move(board, ans)

  puts 'Board state:'
  puts board[:u0].join(' ')
  puts board[:u1].join(' ')
  puts board[:d0].join(' ')
  puts board[:d1].join(' ')

  puts 'Current cards:'
  puts cards.join(' ')

  if cards.size == 6
    print 'Draw 2 cards: '
    # Draw 2 cards
    # Input: <card1> <card2>
    # Ex: 43 90
    i_handler.draw
  end

  puts
end
