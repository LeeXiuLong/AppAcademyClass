require_relative "./card.rb"

class Board

    attr_reader :grid
    
    def initialize(size)
        @grid = Array.new(size){Array.new(size, "-")}
    end

    def populate(cards)
        if cards.length > @grid.flatten.length
            raise 'too many cards!'
        else
            cards.each do |card|
                pos = self.get_random_pos
                while self[pos] != "-"
                    pos = self.get_random_pos
                end
                self[pos] = card
            end
        end
        return true
    end

    def get_random_pos
        x = (0...@grid.length).to_a.sample
        y = (0...@grid.length).to_a.sample
        [x,y] 
    end

    def [](pos)
        x,y = pos
        @grid[x][y] 
    end

    def num_cards
        @grid.flatten.count{|ele| ele != "-"}
    end

    def []=(pos, val)
        x, y = pos
        @grid[x][y] = val
    end

    def render
        @grid.each{|sub_arr| puts sub_arr.join}
        return
    end

    def won?
        p "YOU WIN!!!" if @grid.all?{|subarray| subarray.all? {|card| card.face_up}}
    end

    def guessed_pos(pos)
        if !self[pos].face_up
            self[pos].reveal
            return self[pos]
        else
            p "This card has already been revealed."
        end
    end

end