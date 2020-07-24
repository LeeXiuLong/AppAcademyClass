class Player 
    def initialize(name)
        @name = name
    end

    def get_guess
        p "#{name} please enter your guess."
        gets.chomp
    end

    def alert_invalid_guesses?(guess)
        raise "This is an invalid guess" unless ("a".."z").to_a.include?(guess.downcase) && guess.length == 1
        true
    end

    
end



    
