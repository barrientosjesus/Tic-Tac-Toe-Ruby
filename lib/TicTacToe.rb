# frozen_string_literal: true
require_relative 'board'

class Game
  attr_accessor :turn

  def initialize
    @turn = 9
  end

  def start_game
    squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @board = Board.new(squares)
    @board.layout
    while turn.positive?
      puts "It's your turn X"
      user_input = gets.chomp.to_i
      while user_input < 1 || user_input > 9
        puts "That's already taken or an invalid square, please pick a different square!"
        user_input = gets.chomp.to_i
      end
      while squares[user_input - 1] == 'O' || squares[user_input - 1] == 'X'
        puts "That's already taken or an invalid square, please pick a different square!"
        user_input = gets.chomp.to_i
        if squares[user_input - 1] != 'O' && squares[user_input - 1] != 'X'
          squares[user_input - 1] = 'X'
          break
        end
      end
      squares[user_input - 1] = 'X'
      @board.layout
      @board.check_winner

      puts "It's your turn O"
      user_input_two = gets.chomp.to_i
      while user_input_two < 1 || user_input_two > 9
        puts "That's already taken or an invalid square, please pick a different square!"
        user_input_two = gets.chomp.to_i
      end
      while squares[user_input_two - 1] == 'O' || squares[user_input_two - 1] == 'X'
        puts "That's already taken or an invalid square, please pick a different square!"
        user_input_two = gets.chomp.to_i
        if squares[user_input_two - 1] != 'O' && squares[user_input_two - 1] != 'X'
          squares[user_input_two - 1] = 'O'
          break
        end
      end
      squares[user_input_two - 1] = 'O'
      @board.layout
      @board.check_winner
      @turn -= 1
    end
  end
end

tic_tac_toe = Game.new

tic_tac_toe.start_game
