require "rspec"
require "card"

describe Card do
    
    subject(:queen_of_hearts) {Card.new("Q","H")}
    describe "#initialize" do 
        it "should make a card with a valid value and suit" do 
            expect(queen_of_hearts.suit).to eq("H")
            expect(queen_of_hearts.num_value).to eq(12)
            expect(Card.SUITS).to include(queen_of_hearts.suit)
            expect(Card.CARD_VALUES).to have_key(queen_of_hearts.value)
        end
    end


end

