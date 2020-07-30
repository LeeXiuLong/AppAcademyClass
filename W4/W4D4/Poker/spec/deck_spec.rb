require "rspec"
require "deck"
require "card"

describe Deck do
    subject(:deck) {Deck.new}
    describe "#initialize" do
        it "should have 52 unique card objects in the deck array" do
            expect(deck.set.length).to eq(52)
        end
        it "should contain every unique card" do 
            hash = {}
            Card.SUITS.each do |suit|
                Card.CARD_VALUES.each do |val|
                    hash[suit] = val
                end
            end
            deck.set.each {|card| hash.delete(card.suit) if hash[card.suit] == card.value }
            expect(hash.length).to eq(0)
        end
    end

end
