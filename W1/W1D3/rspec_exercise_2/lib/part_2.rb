require "byebug"

def palindrome?(str)
    str.each_char.with_index { |char, i| return false if str[i] != str[-(i+1)] }
    true
end

def substrings(str)
    substrings = []
    while str.length > 0
        (0..str.length-1).each do |last|
            substring = str[0..last]
            substrings << substring if !substrings.include?(substring)
        end
        str.slice!(0)
    end
    substrings
end

def palindrome_substrings(str)
    subs = substrings(str)
    final = []
    subs.each do |ele|
        if ele.length > 1 && palindrome?(ele)
            final << ele
        end
    end
    final
end

