require "rspec"
require "deck.rb"

describe Deck do
  let(:deck) { Deck.new }

  it "has fifty-two cards!" do
    expect( deck.cards.size ).to eq( 52 )
  end

  it "initializes in order" do
    expect( deck.sorted? ).to eq( true )
  end

  describe "#shuffle" do
    before(:each) { deck.shuffle! }

    it "shuffles!" do
      expect( deck.sorted? ).to eq( false )
    end
  end

  describe "#deal" do
    before(:each) { deck.deal(1) }

    it "takes the top cards from the deck" do
      expect ( deck.cards[0].value ).to eq( "2" )
    end

    it "takes the top cards from the deck" do
      expect ( deck.cards.size ).to eq( 51 )
    end

    it "deals multiple cards at once" do
      expect ( deck.deal(2).length).to eq(2)
    end

    it "will not deal past the deck size" do
      expect { deck.deal(200) }.to raise_error( "Not enough cards in the deck")
    end
  end

  describe "#return" do
    let(:card1) { double("card", suit: "spades")}
    let(:card2) { double("card", suit: "hearts")}
    let(:card3) { double("card", suit: "diamonds")}

    before(:each) { deck.return( [card1] ) }

    it "adds to the bottom of the deck" do
      expect( deck.cards.last ).to eq( card1 )
    end

    it "returns one card to deck" do
      expect( deck.cards.length ).to eq( 53 )
    end

    it "returns two cards to deck" do
      deck.return( [card2, card3] )
      expect( deck.cards.length ).to eq( 55 )
    end

  end

end
