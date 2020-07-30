require_relative './card'

class Deck

    attr_accessor :set

    def initialize
        @set = Array.new(0)
        self.fill_deck
    end

    def fill_deck
        Card.SUITS.each do |suit|
            Card.CARD_VALUES.each do |val|
                @set << Card.new(val, suit)
            end
        end
    end


end