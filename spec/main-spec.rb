require "./lib/logic.rb"


RSpec.describe Board do
    before do
      @board = Board.new
    end
    describe "#win_check" do
      it "Checks for win condition" do
        @board.current_state = [["X","X","X"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
        expect(@board.win_check("X")).to eql(true)
      end
     end
     describe "#empty_counter" do
     it "draw_check" do
      @board.current_state = [["X","O","X"],["O","X","O"],["O","X","O"]]
      expect(@board.empty_counter).to eql(0)
      end
    end
  end
