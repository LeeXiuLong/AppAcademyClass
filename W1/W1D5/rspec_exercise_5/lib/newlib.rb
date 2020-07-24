def silly_syllables(sentence)
    new_words = []
    words = sentence.split
    words.each { |word| new_words = silly(word) }
    new_words.join(" ")
end

def silly(word)
    vowels = "aeiouAEIOU"
    first_vowel_index = 0
    last_vowel_index = 0
    if word.count vowels < 2
        return word
    else
        word.each_char.with_index do |char, i|
            if vowels.include?(char)
                first_vowel_index = i
                break
            end
        end
        word.reverse.each_char.with_index do |char,i|
            if vowels.include?(char)
                last_vowel_index = -i-1
                break
            end
        end
        return word[first_vowel_index..last_vowel_index]
    end

end