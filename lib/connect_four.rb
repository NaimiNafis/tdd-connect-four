#lib/connect_four.rb

# red_circle = "\u{1F534}"
# blue_circle = "\u{1F535}"

class Board
  def initialize(n = 3)
    @board = Array.new(n) { Array.new(n, " ") }
  end

  def display_board
    # Return the string representation of the board instead of puts(direct print to console and return nil)
    @board.map { |row| row.join(' | ') }.join("\n")
  end
end

class Player
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Game
  def initialize
    @board = Board.new(4)
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
  end

  def start_game
    n = 4
    current = @player1

    puts display_welcome_message
    input = gets.chomp.to_i

    while input.negative? || input >= 3
      puts "Choose between 0,1,2,3 only!"
      input = gets.chomp.to_i
    end

  end

  def display_welcome_message
    output = []
    output << "Welcome to Connect Four!"
    output << "Choose which row you want to put your piece!"
    output << "0   1   2   3"
    output << @board.display_board
    output.join("\n")
  end
end

game = Game.new
game.start_game

