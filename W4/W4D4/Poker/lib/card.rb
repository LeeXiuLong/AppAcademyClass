class Card
    attr_accessor :value, :suit, :num_value

    SUITS = ["H", "C", "D", "S"]

    CARD_VALUES = {
    "2"=> 2,
    "3"=> 3,
    "4"=> 4,
    "5"=> 5,
    "6"=> 6,
    "7"=> 7,
    "8"=> 8,
    "9"=> 9,
    "10"=> 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14
    }


    def initialize(value, suit)
        @suit = suit
        @num_value = CARD_VALUES[value]
        @value = value
    end

   def self.CARD_VALUES
    CARD_VALUES
   end

   def self.SUITS
    SUITS
   end

end
