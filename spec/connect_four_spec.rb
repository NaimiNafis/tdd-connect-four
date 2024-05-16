# spec/connect_four_spec.rb
require './lib/connect_four.rb'

describe Board do
  describe "#display_board" do
    it "displays the board with column numbers" do
      board = Board.new(4, 4)
      expected_output = "0   1   2   3\n  |   |   |  \n  |   |   |  \n  |   |   |  \n  |   |   |  "
      expect(board.display_board).to eql(expected_output)
    end

    it "displays the board with pieces correctly" do
      board = Board.new(4, 4)
      board.place_piece(0, 'X')
      board.place_piece(1, 'O')
      board.place_piece(2, 'X')
      expected_output = "0   1   2   3\n  |   |   |  \n  |   |   |  \n  |   |   |  \nX | O | X |  "
      expect(board.display_board).to eql(expected_output)
    end
  end

  describe "#full?" do
    it "returns true if board is full" do
      board = Board.new(4, 4)
      board.instance_variable_set(:@board, Array.new(4) { Array.new(4, "O") })
      expect(board.full?).to eql(true)
    end

    it "returns false if board is not full" do
      board = Board.new(4, 4)
      board.instance_variable_set(:@board, Array.new(4) { Array.new(4, " ") })
      expect(board.full?).to eql(false)
    end
  end

  describe "#place_piece" do
    it "returns row and col if there is no symbol" do
      board = Board.new
      board.instance_variable_set(:@board, Array.new(6) { Array.new(7, " ") })
      row, col = board.place_piece(3, "X")
      expect(board.instance_variable_get(:@board)[row][col]).to eql("X")
    end

    it "returns player's symbol if there is no symbol" do
      board = Board.new
      board.instance_variable_set(:@board, Array.new(6) { Array.new(7, " ") })
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

    it "returns false on an empty board" do
      board = Board.new
      expect(board.check_winner('X')).to be false
      expect(board.check_winner('O')).to be false
    end

    it "returns false on a partially filled board with no winner" do
      board = Board.new
      board.place_piece(0, 'X')
      board.place_piece(1, 'O')
      board.place_piece(2, 'X')
      expect(board.check_winner('X')).to be false
      expect(board.check_winner('O')).to be false
    end
  end

end

# spec/connect_four_spec.rb
describe Game do

  describe "#start_game" do
    it "plays a complete game resulting in a draw" do
      game = Game.new
      allow(game).to receive(:gets).and_return(
        '0', '0', '1', '1', '2', '2', '3', '3', '4', '4', '5', '5', '6', '6',
        '0', '0', '1', '1', '2', '2', '3', '3', '4', '4', '5', '5', '6', '6',
        '0', '0', '1', '1', '2', '2', '3', '3', '4', '4', '5', '5', '6', '6'
      )

      expect { game.start_game }.to output(/The board is full! It's a draw./).to_stdout
    end

    it "plays a complete game with a winner" do
      game = Game.new
      allow(game).to receive(:gets).and_return('0', '1', '0', '1', '0', '1', '0') # Player 1 wins vertically

      expect { game.start_game }.to output(/Congratulations! Player 1 wins!/).to_stdout
    end
  end

  describe "#player_input" do
    let(:game) { Game.new }

    it "accepts valid column inputs within range 0 to 6" do
      allow(game).to receive(:gets).and_return('2')
      expect(game.player_input).to eql(2)
    end

    it "prompts again if the input is out of range" do
      allow(game).to receive(:gets).and_return('7', '2')
      expect(game).to receive(:puts).with("Invalid input! Please choose a column number between 0 and 6.").once
      expect(game.player_input).to eql(2)
    end

    it "prompts again if the input is not a number" do
      allow(game).to receive(:gets).and_return('a', '2')
      expect(game).to receive(:puts).with("Invalid input! Please choose a column number between 0 and 6.").once
      expect(game.player_input).to eql(2)
    end
  end

  describe "#valid_input?" do
    let(:game) { Game.new }

    it "returns true for valid numeric input within range" do
      expect(game.send(:valid_input?, '2')).to be true
    end

    it "returns false for out of range input" do
      expect(game.send(:valid_input?, '7')).to be false
    end

    it "returns false for non-numeric input" do
      expect(game.send(:valid_input?, 'a')).to be false
    end

    it "returns false for negative input" do
      expect(game.send(:valid_input?, '-1')).to be false
    end

    it "returns false for empty input" do
      expect(game.send(:valid_input?, '')).to be false
    end
  end

  describe "#switch_player" do
    it "switches the current player" do
      game = Game.new
      player1 = game.instance_variable_get(:@player1)
      player2 = game.instance_variable_get(:@player2)

      expect(game.instance_variable_get(:@current_player)).to eql(player1)

      game.send(:switch_player)
      expect(game.instance_variable_get(:@current_player)).to eql(player2)

      game.send(:switch_player)
      expect(game.instance_variable_get(:@current_player)).to eql(player1)
    end
  end
end

