#spec/connect_four_spec.rb
require './lib/connect_four.rb'

#puts 
describe Board do
  describe "#display_board" do
    it "displays the board of n*n" do
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
                        "1   2   3   4\n" +
                        "  |   |   |  \n" +
                        "  |   |   |  \n" +
                        "  |   |   |  \n" +
                        "  |   |   |  "
      expect(game.start_game).to eql(expected_output)
    end
  end
end

  