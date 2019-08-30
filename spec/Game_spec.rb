require "./lib/logic.rb"

RSpec.describe Game do
    before do
      @game = Game.new
    end
  
    it "checks a valid user input/move" do
      @game.turn("1,2", "O")
      expect(@game.valid_move).to eql(true)
    end
  
    it "checks an invalid user input/move" do
      @game.board.current_state = [["O", "1,2", "1,3"], ["2,1", "2,2", "2,3"], ["3,1", "3,2", "3,3"]]
      @game.turn("1,1", "X")
      expect(@game.valid_move).to eql(false)
    end
  
    it "checks an invalid syntax" do
      @game.turn("4,1", "X")
      expect(@game.valid_move).to eql(false)
  
      @game.turn("4", "X")
      expect(@game.valid_move).to eql(false)
  
      @game.turn("I'm so clever", "X")
      expect(@game.valid_move).to eql(false)
    end
  
    it "checks for turn handover" do
      curr_player = @game.current_player
      @game.turn("1,1", "X")
      expect(@game.current_player).not_to eql(curr_player)
    end
  
    it "checks if current state is updating" do
      initialValue = @game.board.current_state[0][0]
      @game.turn("1,1","X")
      expect(@game.board.current_state[0][0]).not_to eql(initialValue)
    end
  end