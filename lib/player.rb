class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end

module Players
  class Human < Player
    def move(board = Board.new)
      puts "Enter a number:"
      user_input = gets.chomp
      user_input
    end
  end
  class Computer < Player
    def move(board)
      if @board.taken?(1)
        if @board.taken?(3)
          if @board.taken?(7)
            if @board.taken(5)
              9
            else
              5
            end
          else
            7
          end
        else
          3
        end
      else
        1
      end
    end
  end
end
