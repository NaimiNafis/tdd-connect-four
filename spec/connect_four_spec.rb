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

  