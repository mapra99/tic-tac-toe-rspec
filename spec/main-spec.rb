require '/home/ben/GitProjects/Ruby/Tic-tac-toe/bin/main.rb'

RSpec.describe start do
    describe "#start_game" do
      it "initializes game" do
        player1 = create_player("X")
        player2 = create_player("O")
        expect(start(player1,player2)).to eql(game)
      end
    end
  end