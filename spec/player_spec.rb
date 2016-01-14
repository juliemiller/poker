require "rspec"
require "player.rb"

describe Player do
    let(:player) { Player.new(pot) }

    it "initializes the player with a pot of money" do
      expect( player.pot.nil? ).to be_false
    end

    describe "#take_turn_discard" do
      it "returns an array of cards to discard" do
        allow(STDIN).to receive(:gets).and_return("1,3")
        expect( player.take_turn_discard ).to be([1,3])
      end
    end

    describe "take_turn_action" do
      it "gets user input on what to do" do
        allow(STDIN).to receive(:gets).and_return("fold")
        expect( player.take_turn_action ).to be(:fold)
      end
      it "gets user input on what to do" do
        allow(STDIN).to receive(:gets).and_return("see")
        expect( player.take_turn_action ).to be(:see)
      end
      it "gets user input on what to do" do
        allow(STDIN).to receive(:gets).and_return("raise")
        expect( player.take_turn_action ).to be(:raise)
      end

    end
end
