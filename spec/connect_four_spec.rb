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
    xit "returns row and col if there is no symbol" do
      board = Board.new
      board.instance_variable_set(:@board, Array.new(6) { Array.new(7, " ") })
      row, col = board.place_piece(3, "X")
      expect(board.instance_variable_get(:@board)[row][col]).to eql("X")
    end

    xit "returns player's symbol if there is no symbol" do
      board = Board.new
      board.instance_variable_set(:@board, Array.new(6) { Array.new(7, " ") })
      row, col = board.place_piece(3, "X")
      expect([row, col]).to eql([5, 3])
    end

    xit "returns nil if the column is full" do
      board = Board.new
      full_column = Array.new(6, "X")
      board.instance_variable_set(:@board, Array.new(6) { full_column.clone }) # Set one column to be full
      expect(board.place_piece(3, "O")).to eql(nil)
    end
  end
  
  describe '#check_winner' do

    describe 'when there is a horizontal win' do
      board = Board.new
      it 'returns true for a horizontal win' do
        board.place_piece(0, 'X')
        board.place_piece(1, 'X')
        board.place_piece(2, 'X')
        board.place_piece(3, 'X')
        expect(board.check_winner('X')).to be true
      end
    end

    describe 'when there is a vertical win' do
      board = Board.new
      it 'returns true for a vertical win' do
        4.times { board.place_piece(0, 'O') }
        expect(board.check_winner('O')).to be true
      end
    end

    describe 'when there is a diagonal win (top-left to bottom-right)' do
      board = Board.new
      it 'returns true for a diagonal win' do
        board.place_piece(0, 'X')
        board.place_piece(1, 'O')
        board.place_piece(1, 'X')
        board.place_piece(2, 'O')
        board.place_piece(2, 'O')
        board.place_piece(2, 'X')
        board.place_piece(3, 'O')
        board.place_piece(3, 'O')
        board.place_piece(3, 'O')
        board.place_piece(3, 'X')
        expect(board.check_winner('X')).to be true
      end
    end

    describe 'when there is a diagonal win (bottom-left to top-right)' do
      board = Board.new
      it 'returns true for a diagonal win' do
        board.place_piece(3, 'X')
        board.place_piece(2, 'O')
        board.place_piece(2, 'X')
        board.place_piece(1, 'O')
        board.place_piece(1, 'O')
        board.place_piece(1, 'X')
        board.place_piece(0, 'O')
        board.place_piece(0, 'O')
        board.place_piece(0, 'O')
        board.place_piece(0, 'X')
        expect(board.check_winner('X')).to be true
      end
    end

    describe 'when there is no win' do
      board = Board.new
      it 'returns false if there is no win' do
        board.place_piece(0, 'X')
        board.place_piece(1, 'X')
        board.place_piece(2, 'X')
        board.place_piece(4, 'X')
        expect(board.check_winner('X')).to be false
      end
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

  describe "#player_input" do
    xit "accepts valid column inputs within range 0 to 6" do
      game = Game.new
      # Stubbing gets.chomp to return '2'
      allow(game).to receive(:gets).and_return('2')

      # Testing that the input '2' is correctly interpreted
      expect(game.player_input).to eql(2)
    end

    xit "prompts again if the input is out of range" do
      game = Game.new
      # Stubbing gets.chomp to return '7' first and then '2'
      allow(game).to receive(:gets).and_return('7', '2')

      # Testing that the input '2' is correctly interpreted after an invalid input
      expect(game.player_input).to eql(2)
    end
  end

  describe "#switch_player" do
    xit "switches the current player from player1 to player2" do
      game = Game.new
      player1 = game.instance_variable_get(:@player1)
      player2 = game.instance_variable_get(:@player2)

      expect(game.instance_variable_get(:@current_player)).to eql(player1)
      
      game.switch_player
      expect(game.instance_variable_get(:@current_player)).to eql(player2)

      game.switch_player
      expect(game.instance_variable_get(:@current_player)).to eql(player1)
    end
  end

end
