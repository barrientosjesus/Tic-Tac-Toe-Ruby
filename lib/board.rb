class Board
    attr_accessor :square
  
    def initialize(square)
      @square = square
    end
  
    def layout
      system 'clear'
      puts ' '
      puts 'TIC-TAC-TOE'
      puts ''
      puts " #{square[0]} ┃ #{square[1]} ┃ #{square[2]} "
      puts '━━━╋━━━╋━━━'
      puts " #{square[3]} ┃ #{square[4]} ┃ #{square[5]} "
      puts '━━━╋━━━╋━━━'
      puts " #{square[6]} ┃ #{square[7]} ┃ #{square[8]} "
      puts ''
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
      end
    end
  end