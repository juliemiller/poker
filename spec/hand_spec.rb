require 'rspec'
require 'hand.rb'

describe Hand do
  let(:hand) { Hand.new}
  let(:two_diamonds) { double("card", suit: :diamonds, value: 2) }
  let(:two_spades) { double("card", suit: :spades, value: 2) }
  let(:four_spades) { double("card", suit: :spades, value: 4)}
  let(:six_spades) { double("card", suit: :spades, value: 6)}
  let(:seven_diamonds) { double("card", suit: :diamonds, value: 7)}
  let(:eight_spades) { double("card", suit: :spades, value: 8)}
  let(:nine_clubs) { double("card", suit: :clubs, value: 9)}
  let(:nine_diamonds) { double("card", suit: :diamonds, value: 9) }
  let(:nine_hearts) { double("card", suit: :hearts, value: 9)}
  let(:nine_spades) { double("card", suit: :spades, value: 9)}
  let(:ten_diamonds) { double("card", suit: :diamonds, value: 10)}
  let(:jack_diamonds) { double("card", suit: :diamonds, value: 11)}
  let(:queen_diamonds) { double("card", suit: :diamonds, value: 12)}
  let(:king_diamonds) { double("card", suit: :diamonds, value: 13)}
  let(:one_pair){ Hand.new([:two_diamonds,:two_spades, :nine_hearts, :four_spades, :ten_diamonds])}
  let(:one_pair_higher){ Hand.new([:two_diamonds,:two_spades, :king_diamonds, :four_spades, :ten_diamonds])}
  let(:two_pair){ Hand.new([:two_diamonds,:two_spades, :nine_hearts, :four_spades, :nine_diamonds])}
  let(:three_of_a_kind){ Hand.new([:nine_clubs,:two_spades, :nine_hearts, :four_spades, :nine_diamonds])}
  let(:straight){ Hand.new([:ten_diamonds,:nine_clubs,:eight_spades,:seven_diamonds,:six_spades])}
  let(:flush){ Hand.new([:ten_diamonds,:king_diamonds,:nine_diamonds,:seven_diamonds,:two_diamonds])}
  let(:full_house){ Hand.new([:nine_clubs,:nine_hearts,:nine_diamonds,:two_diamonds,:two_spades])}
  let(:four_of_a_kind){ Hand.new([:ten_diamonds,:nine_clubs,:nine_diamonds,:nine_spades,:nine_hearts])}
  let(:straight_flush){ Hand.new([:king_diamonds, :queen_diamonds, :jack_diamonds, :ten_diamonds, :nine_diamonds])}
  let(:winning_hands) {[:one_pair, :two_pair, :three_of_a_kind, :straight,
     :flush, :full_house, :four_of_a_kind, :straight_flush]}


  it "initializes with an empty hand" do
    expect ( hand.cards.empty? ).to eq( true )
  end

  describe "#get_card" do
    before(:each) { hand.get_card( card1 ) }

    it "accepts a card" do
      expect( hand.cards.length ).to eq( 1 )
    end

    it "accepts another card" do
      hand.get_card(card2)
      expect( hand.cards.length ).to eq( 2 )
    end
  end

  describe "#discard" do

    it "discards one card at a time" do
      one_pair.discard( 0 )
      expect( one_pair.length ).to eq( 4 )
    end

    it "wont discard a card it doesnt have" do
      expect{ one_pair.discard( 9 ) }.to raise_error(DiscardError)
    end

    it "returns discarded card" do
      expect( one_pair.discard(0) ).to eq( card1 )
    end

  end

  describe "#beats?" do

    it "finds the winning hand" do
      winning_hands.each_with_index do |hand1, idx1|
        winning_hands.each do |hand2, idx2|
          if idx1 > idx2
            expect(hand1.beats?(hand2)).to be_true
          elsif idx2 > idx1
            expect(hand1.beats?(hand2)).to be_false
          end
        end
      end
    end

    it "chooses the hand with the higher card when necessary" do
      expect(one_pair_higher.beats?(one_pair)).to be_true
    end

  end

end
