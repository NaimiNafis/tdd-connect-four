# spec/connect_four_spec.rb
require './lib/connect_four.rb'

describe Board do
  describe "#display_board" do
    xit "displays the board of n*n" do
      board = Board.new(4, 4)
      expected_output = "  |   |   |  \n  |   |   |  \n  |   |   |  \n  |   |   |  "
      expect(board.display_board).to eql(expected_output)
    end
  end

  describe "#full?" do
    xit "returns true if board is full" do
      board = Board.new(4, 4)
      board.instance_variable_set(:@board, Array.new(4) { Array.new(4, "O") })
      expect(board.full?).to eql(true)
    end

    xit "returns false if board is not full" do
      board = Board.new(4, 4)
      board.instance_variable_set(:@board, Array.new(4) { Array.new(4, " ") })
      expect(board.full?).to eql(false)
    end
  end

  describe "#place_piece" do
    it "returns row and col if there is no symbol" do
      board = Board.new
      board.instance_variable_set(:@board, Array.new(6) { Array.new(7, " ") }) # 6 rows and 7 columns
      row, col = board.place_piece(3, "X")
      expect(board.instance_variable_get(:@board)[row][col]).to eql("X")
    end

    it "returns player's symbol if there is no symbol" do
      board = Board.new
      board.instance_variable_set(:@board, Array.new(6) { Array.new(7, " ") }) # 6 rows and 7 columns
      row, col = board.place_piece(3, "X")
      expect([row, col]).to eql([5, 3])
    end

    it "returns nil if the column is full" do
      board = Board.new
      full_column = Array.new(6, "X")
      board.instance_variable_set(:@board, Array.new(6) { full_column.clone }) # Set one column to be full
      expect(board.place_piece(3, "O")).to eql(nil)
    end
  end

end

describe Game do
  describe "#display_welcome_message" do
    xit "displays the board and welcome message" do
      game = Game.new
      expected_output = "Welcome to Connect Four!\n" +
                        "Choose a column to put your piece (0-6):\n" +
                        "  |   |   |   |   |   |   |  \n" +
                        "  |   |   |   |   |   |   |  \n" +
                        "  |   |   |   |   |   |   |  \n" +
                        "  |   |   |   |   |   |   |  \n" +
                        "  |   |   |   |   |   |   |  \n" +
                        "  |   |   |   |   |   |   |  "
      expect(game.display_welcome_message).to eql(expected_output)
    end
  end

  describe "#start_game" do
    xit "accepts valid column inputs within range 0 to 6" do
      game = Game.new
      # Stubbing gets.chomp to return '2'
      allow(game).to receive(:gets).and_return('2')

      # Testing that the input '2' is correctly interpreted
      expect(game).to receive(:player_input).and_return(2)
      expect([0, 1, 2, 3, 4, 5, 6]).to include(game.start_game)
    end
  end
end
