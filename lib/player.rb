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
      if board.valid?("1")
        "1"
      else
        "3"
      end
    end
  end
end
