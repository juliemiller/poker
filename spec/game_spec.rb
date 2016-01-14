require 'rspec'
require 'game.rb'

describe Game do
  let(:game) { Game.new }

  it "holds a deck" do
    expect( Game.deck.is_a?( Deck ) ).to be_true
  end

  it "shuffles the deck upon initialization" do
    expect( Game.deck.ordered? ).to be_false
  end
end
