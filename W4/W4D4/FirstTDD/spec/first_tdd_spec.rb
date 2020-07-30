require "rspec"
require "first_tdd"


describe Array do
    subject(:arr) {Array.new}

    describe "#my_uniq" do              # arr.my_uniq [1,1,2,3]  => [1,2,3]
        it "should remove all duplicates" do
            arr = [1,1,2,3,4,4]
            expect(arr.my_uniq).to eq(arr.uniq)
        end
    end

    describe "#two_sum" do
        it "should find all pairs of positions where elements at those positions sum to zero" do
            arr = [-1,0,2,-2,1]
            expect(arr.two_sum).to eq([[0,4],[2,3]])
        end
    end

    describe "#my_transpose"do
        it "should transpose a 2d array" do
            arr = [
                [0, 1, 2],
                [3, 4, 5],
                [6, 7, 8]
                ]
            expect(arr.my_transpose).to eq([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
        end
    end
end


describe "#stock_picker" do
    subject(:arr) {Array.new}
    it "should return the most profitable day pair to buy and sell" do
        arr = [5,5,4,7,8,2,3,4,5]
        expect(stock_picker(arr)).to eq([2,4])
    end
end

describe Towers do 
    subject(:game) {Towers.new(3)}

    describe "#initialize" do 
        it "should make a board with three arrays and stones represented by integers in the first array" do 
            expect(game.board).to eq([[3,2,1],[],[]])   
        end
    end

    describe "#move" do 
        it "should get input from user" do 
        
        end
    end

end


