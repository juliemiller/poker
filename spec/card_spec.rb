require 'rspec'
require 'card.rb'

describe Card do
  let(:card) { Card.new( :king, :spades ) }

  it "knows its suit" do
    expect( card.suit ).to eq( :spades )
  end

  it "has a type" do
    expect( card.type ).to eq( :king )
  end

  it "has a color" do
    expect( card.color ).to eq( :black )
  end

  it "has a value" do
    expect( card.value ).to eq( 13 )
  end

end
