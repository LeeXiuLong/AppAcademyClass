def hipsterfy(str)
    vowels = "aeiou"
    reversed = str.reverse
    reversed.each_char.with_index do |letter, i|
        if vowels.include?(letter)
            return (reversed[0...i] + reversed[(i + 1)..-1]).reverse
        end
    end

    str
end

def vowel_counts(str)
    vowels ="aeiou"
    newHash = Hash.new(0)
    vowels.each_char { |vowel| newHash[vowel] = str.downcase.count(vowel) if str.downcase.count(vowel) > 0 }
    p newHash
    newHash
end

def caesar_cipher(message, num)
    alpha = ("a".."z").to_a
    cipher = ""

    message.each_char do |letter|
        if alpha.include?(letter)
            cipher += alpha[((alpha.index(letter)) + num) % 26 ]
        else
            cipher += letter
        end
    end

    cipher
end