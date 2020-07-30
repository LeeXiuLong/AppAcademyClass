require 'rspec'
require 'hand'

describe Hand do 
    
    subject(:hand) {Hand.new(arr)}
    describe "#initialize" do 
        it "should have five cards in the hand" do
        expect(arr.length).to eq(5)
        end
    end
    describe "#royal_flush" do 
        it "should have five cards of the same suit" do 
        arr = [Card.new(10, "H"), Card.new(11, "H"), Card.new(12, "H"), Card.new(13, "H"), Card.new(10, "H")]


    end

end