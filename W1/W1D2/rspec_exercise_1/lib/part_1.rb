def average(num1, num2)
    sum = num1 + num2
    sum / 2.0
end

def average_array(arr)
    (arr.sum) / (arr.length.to_f)
end

def repeat(str, num)
    str * num
end

def yell(str)
    str.upcase! + "!"
end

def alternating_case(sentence)
    words = sentence.split(" ")
    newWords = words.map.with_index do |word, i|
        if i.even?
            word.upcase
        else
            word.downcase
        end
    end
    newWords.join(" ")
end

