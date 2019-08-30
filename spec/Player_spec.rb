require_relative "../lib/logic.rb"

RSpec.describe Player do
    it "checks if a player is being correctly created" do
      pl = Player.new("X", "Ben")
      expect(pl.name).to eql("Ben")
      expect(pl.character).to eql("X")
    end
    it "checks that player is not nil" do
        pl = Player.new("X", "Ben")
        expect(pl).not_to eql(nil)
        expect(pl.name).not_to eql(nil)
        expect(pl.character).not_to eql(nil)
      end
  end