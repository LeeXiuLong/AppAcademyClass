def select_even_nums(arr)
    arr.select { |el| el.even? }
end

def reject_puppies(array)
    array.reject { |hash| hash["age"] <= 2}
end

def count_positive_subarrays(array)
    array.count { |arr| arr.sum > 0}
end

def aba_translate(word)
    new_str = ""
    vowels = "aeiou"
    word.each_char do |letter|
        if vowels.include?(letter)
            newChar = letter + "b" + letter
            new_str += newChar
        else
            new_str += letter
        end
    end

    new_str
end

def aba_array(arr)
    arr.map { |el| aba_translate(el) }
end