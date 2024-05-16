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

  def check_winner(symbol)
    (0...@rows).each do |row|
      (0...@cols).each do |col|
        return true if check_direction(row, col, 1, 0, symbol) || # Horizontal
                       check_direction(row, col, 0, 1, symbol) || # Vertical
                       check_direction(row, col, 1, 1, symbol) || # Diagonal \
                       check_direction(row, col, 1, -1, symbol)   # Diagonal /
      end
    end
    false
  end

  private 
  
  def check_direction(row, col, row_step, col_step, symbol)
    4.times do
      return false if row < 0 || row >= @rows || col < 0 || col >= @cols
      return false if @board[row][col] != symbol
      row += row_step
      col += col_step
    end
    true
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
    @current_player = @player1
  end

  def start_game
    
    puts display_welcome_message

    until @board.full?
      col = player_input
      row, col = @board.place_piece(col, @current_player.symbol)
      if row.nil?
        puts "Column full! Choose another one."
        next
      end

      puts @board.display_board

     if @board.check_winner(@current_player.symbol) == true
        puts "Congratulations! #{@current_player.name} wins!"
     end 

      switch_player
    end
  end

  def display_welcome_message
    "Welcome to Connect Four! Choose a column (0-#{@board.board.first.size}) to place your piece.\n#{@board.display_board}"
  end

  def player_input
    input = gets.chomp.to_i

    while input.negative? || input >= @board.board.first.size
      puts "Choose between 0 and 6 only!"
      input = gets.chomp.to_i
    end
    input
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end
end

# game = Game.new
# game.start_game