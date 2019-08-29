require '/home/ben/GitProjects/Ruby/Tic-tac-toe/bin/main.rb'

RSpec.describe win_check do
    describe "#win_check" do
      before do
        @game = Game.new
        @game.board.current_state = [["X","X","X"],["2,1","2,2","2,3"],["3,1","3,2","3,3"]]
      end
      it "initializes game" do
        expect(@game.win_check("X")).to eql(true)
      end
    end
  end