require 'pry'

class Game
  WIN_COMBINATIONS =
  [[0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [2, 5, 8],
  [1, 4, 7],
  [0, 4, 8],
  [2, 4, 6]]

    attr_accessor :board, :player_1, :player_2, :token
    include Players

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      @player_1 = player_1
      @player_2 = player_2
      @board = board

    end

    def current_player
      if @board.turn_count.odd?
        @player_2
      else
        @player_1
      end
    end

    def over?
      if self.draw? || self.won?
        true
      else
        false
      end
    end

    def won?
      WIN_COMBINATIONS.detect do |combination|

          if self.board.cells[combination[0]] == self.board.cells[combination[1]] && self.board.cells[combination[0]] == self.board.cells[combination[2]]
            return combination
          else
            false
          end
        end
      end

    def draw?
      if self.won?
        false
      elsif self.board.full?
        true
      else
        false
      end
    end

    def winner
        winning_combo = self.won?
        winner = self.board.cells[winning_combo[0]]
        if winner == " "
          nil
        else
          winner
        end
    end

    def turn
      move = self.current_player.move(@board)
        if @board.valid_move?(move)
          self.board.update(move, self.current_player)
        else
          self.current_player.move
        end
    end

    def play
      until self.over?
        self.turn
      end
      if self.won? != nil
        if self.winner == "X"
          puts "Congratulations X!"
        elsif self.winner == "O"
          puts "Congratulations O!"
        end
      elsif self.draw? == true
        puts "Cat's Game!"
      end
    end

end
