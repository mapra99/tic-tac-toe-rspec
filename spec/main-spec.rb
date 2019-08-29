require "./lib/logic.rb"


RSpec.describe Board do
      before do
        @board = Board.new
      end
      describe "#win_check" do
      it "checks if player has won by row" do
        @board.current_state = [["X","X","X"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
        expect(@board.win_check("X")).to eql(true)

        @board.current_state = [["1,1","1,2","1,3"],["X","X","X"],["3,1","3,2","3,3"]]
        expect(@board.win_check("X")).to eql(true)

        @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","2,3"],["X","X","X"]]
        expect(@board.win_check("X")).to eql(true)
      end

      it "checks if player has won by column" do
        @board.current_state = [["X","1,2","1,3"],["X","2,2","2,3"],["X","3,2","3,3"]]
        expect(@board.win_check("X")).to eql(true)

        @board.current_state = [["1,1","X","1,3"],["2,1","X","2,3"],["3,1","X","3,3"]]
        expect(@board.win_check("X")).to eql(true)

        @board.current_state = [["1,1","1,2","X"],["2,1","2,2","X"],["3,1","3,2","X"]]
        expect(@board.win_check("X")).to eql(true)
      end

      it "checks if player has won by diagonals" do
        @board.current_state = [["X","1,2","1,3"],["2,1","X","2,3"],["3,1","3,2","X"]]
        expect(@board.win_check("X")).to eql(true)

        @board.current_state = [["1,1","1,2","X"],["2,1","X","2,3"],["X","3,2","3.3"]]
        expect(@board.win_check("X")).to eql(true)
      end
    end

      describe "#emptyCounter" do
          it "checks for a full for draw" do
            @board.current_state = [["X","X","O"],["X","X","O"],["O","O","X"]]
            expect(@board.emptyCounter).to eql(0)
          end

          it "checks for an empty board" do
            @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
            expect(@board.emptyCounter).to eql(9)
          end

          it "checks for an empty board" do
            @board.current_state = [["1,1","1,2","1,3"],["2,1","2,2","O"],["3,1","3,2","X"]]
            expect(@board.emptyCounter).to eql(7)
          end
        end
  end
