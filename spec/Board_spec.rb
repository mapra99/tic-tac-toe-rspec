require_relative "../lib/logic.rb"

RSpec.describe Board do
    before do
      @board = Board.new
    end
    describe "#intitialize" do
    it "checks if the board is being correctly created" do
      @board_test = Board.new
      expect(@board_test.current_state).to eql([["1,1","2,1","3,1"],["1,2","2,2","3,2"],["1,3","2,3","3,3"]])
      expect(@board_test.current_state).not_to eql(nil)
    end
  end
    describe "#win_check" do
    it "checks if player has won by row" do
      @board.current_state = [["X","X","X"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","1,2","1,3"],["X","X","X"],["3,1","3,2","3,3"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","2,3"],["X","X","X"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","2,3"],["O","X","X"]]
      expect(@board.win_check("X")).to eql(false)

      @board.current_state = [["1,1","1,2","1,3"],["X","O","X"],["3,1","3,2","3,3"]]
      expect(@board.win_check("X")).to eql(false)

      @board.current_state = [["X","X","O"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
      expect(@board.win_check("X")).to eql(false)
    end

    it "checks if player has won by column" do
      @board.current_state = [["X","1,2","1,3"],["X","2,2","2,3"],["X","3,2","3,3"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","X","1,3"],["2,1","X","2,3"],["3,1","X","3,3"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","1,2","X"],["2,1","2,2","X"],["3,1","3,2","X"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","1,2","X"],["2,1","2,2","O"],["3,1","3,2","X"]]
      expect(@board.win_check("X")).to eql(false)

      @board.current_state = [["1,1","X","1,3"],["2,1","O","2,3"],["3,1","X","3,3"]]
      expect(@board.win_check("X")).to eql(false)

      @board.current_state = [["O","1,2","1,3"],["X","2,2","2,3"],["X","3,2","3,3"]]
      expect(@board.win_check("X")).to eql(false)
    end

    it "checks if player has won by diagonals" do
      @board.current_state = [["X","1,2","1,3"],["2,1","X","2,3"],["3,1","3,2","X"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["1,1","1,2","X"],["2,1","X","2,3"],["X","3,2","3.3"]]
      expect(@board.win_check("X")).to eql(true)

      @board.current_state = [["X","1,2","1,3"],["2,1","O","2,3"],["3,1","3,2","X"]]
      expect(@board.win_check("X")).to eql(false)

      @board.current_state = [["1,1","1,2","X"],["2,1","X","2,3"],["O","3,2","3.3"]]
      expect(@board.win_check("X")).to eql(false)
    end
    it "checks if players have reached a draw by a false win_check" do
      @board.current_state = [["O","X","O"],["X","X","O"],["O","O","X"]]
          expect(@board.win_check("X")).to eql(false)
          expect(@board.win_check("O")).to eql(false)
    end
  end

    describe "#empty_counter" do
        it "checks for a full board for draw with empty counter" do
          @board.current_state = [["X","X","O"],["X","X","O"],["O","O","X"]]
          expect(@board.empty_counter).to eql(0)
        end

        it "checks for an empty board" do
          @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
          expect(@board.empty_counter).to eql(9)
        end

        it "checks for an empty board" do
          @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","O"],["3,1","3,2","X"]]
          expect(@board.empty_counter).to eql(7)
        end
      end
end