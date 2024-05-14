#spec/connect_four_spec.rb
require './lib/connect_four.rb'

#puts 
describe Board do
  describe "#display_board" do
    xit "displays the board of n*n" do
      board = Board.new(4)
      expected_output = "  |   |   |  \n  |   |   |  \n  |   |   |  \n  |   |   |  "
      expect(board.display_board).to eql(expected_output)
    end
  end
end

describe Game do
  describe "#display_welcome_message" do
    it "displays the board and welcome message" do
      game = Game.new
      expected_output = "Welcome to Connect Four!\n" +
                        "Choose which row you want to put your piece!\n" +
                        "0   1   2   3\n" +
                        "  |   |   |  \n" +
                        "  |   |   |  \n" +
                        "  |   |   |  \n" +
                        "  |   |   |  "
      expect(game.display_welcome_message).to eql(expected_output)
    end
  end

  describe "#start_game" do
    it "returns 0, 1, 2, 3" do
      game = Game.new
      # Stubbing gets.chomp to return '2'
      allow(game).to receive(:gets).and_return('2')
      
      # Testing that the input '2' is correctly interpreted
      expect([0, 1, 2, 3]).to include(game.start_game.to_i)
    end
  end
end
