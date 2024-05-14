#lib/connect_four.rb

red_circle = "\u{1F534}"
blue_circle = "\u{1F535}"

class Board
  def initialize(n = 3)
    @board = Array.new(n) { Array.new(n, " ") }
  end

  def display_board
    # Return the string representation of the board instead of puts(direct print to console)
    @board.map { |row| row.join(' | ') }.join("\n")
  end
end

