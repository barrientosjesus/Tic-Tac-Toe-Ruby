# frozen_string_literal: true

class Board
  attr_accessor :square

  def initialize(square)
    @square = square
  end

  def layout
    puts ' '
    puts ' TIC-TAC-TOE '
    puts '-------------'
    puts "| #{square[0]} | #{square[1]} | #{square[2]} |"
    puts '-------------'
    puts "| #{square[3]} | #{square[4]} | #{square[5]} |"
    puts '-------------'
    puts "| #{square[6]} | #{square[7]} | #{square[8]} |"
    puts '-------------'
    puts ' '
  end

  def check_winner
    if @square[0] == @square[1] && @square[1] == @square[2]
      puts '****************'
      puts "#{square[0]} is the winner!"
      puts '****************'
      exit
    elsif @square[3] == @square[4] && @square[4] == @square[5]
      puts '****************'
      puts "#{square[3]} is the winner!"
      puts '****************'
      exit
    elsif @square[6] == @square[7] && @square[7] == @square[8]
      puts '****************'
      puts "#{square[6]} is the winner!"
      puts '****************'
      exit
    elsif @square[0] == @square[3] && @square[3] == @square[6]
      puts '****************'
      puts "#{square[0]} is the winner!"
      puts '****************'
      exit
    elsif @square[1] == @square[4] && @square[4] == @square[7]
      puts '****************'
      puts "#{square[1]} is the winner!"
      puts '****************'
      exit
    elsif @square[2] == @square[5] && @square[5] == @square[8]
      puts '****************'
      puts "#{square[2]} is the winner!"
      puts '****************'
      exit
    elsif @square[0] == @square[4] && @square[4] == @square[8]
      puts '****************'
      puts "#{square[0]} is the winner!"
      puts '****************'
      exit
    elsif @square[2] == @square[4] && @square[4] == @square[6]
      puts '****************'
      puts "#{square[2]} is the winner!"
      puts '****************'
      exit
    elsif @square.all? { |a| a.is_a? String }
      puts '********'
      puts 'TIE GAME'
      puts '********'
      exit
    else
      puts 'Next'
    end
  end
end

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
        puts "You didn't pick a square, please pick a square!"
        user_input = gets.chomp.to_i
      end
      while squares[user_input - 1] == 'O' || squares[user_input - 1] == 'X'
        puts "That's already taken, please pick a different square!"
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
        puts "You didn't pick a square, please pick a square!"
        user_input_two = gets.chomp.to_i
      end
      while squares[user_input_two - 1] == 'O' || squares[user_input_two - 1] == 'X'
        puts "That's already taken, please pick a different square!"
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
