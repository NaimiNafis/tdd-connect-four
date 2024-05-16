# lib/connect_four.rb

class Board
  attr_reader :board

  def initialize(rows = 6, cols = 7)
    @rows = rows
    @cols = cols
    @board = Array.new(rows) { Array.new(cols, " ") }
  end

  def display_board
    @board.map { |row| row.join(' | ') }.join("\n")
  end

  def full?
    @board.all? { |row| row.none? { |cell| cell == " " } }
  end

  def place_piece(col, symbol)
    (0...@rows).reverse_each do |row|
      if @board[row][col] == " "
        @board[row][col] = symbol
        return row, col
      end
    end
    nil
  end
end

class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "X")
    @player2 = Player.new("Player 2", "O")
  end

  def start_game
    
    puts display_welcome_message
    input = gets.chomp.to_i

    while input.negative? || input >= 7
      puts "Choose between 0 and 6 only!"
      input = gets.chomp.to_i
    end
  end

  def display_welcome_message
    output = []
    output << "Welcome to Connect Four!"
    output << "Choose a column to put your piece (0-6):"
    output << @board.display_board
    output.join("\n")
  end
end

game = Game.new
game.start_game
