class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    return [] if !@secret_word.include?(char)
    indices = []
    i = 0
    while i < @secret_word.length
      indices << i if @secret_word[i] == char
      i += 1
    end
    indices
  end

  def fill_indices(char, arr)
    @guess_word.each_with_index { |ele, i| @guess_word[i] = char if arr.include?(i) }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << char
      if self.get_matching_indices(char).length == 0
        @remaining_incorrect_guesses -= 1
      else
        self.fill_indices(char, self.get_matching_indices(char))
      end
    end
    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    input = gets.chomp
    return self.try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false
  end

end
