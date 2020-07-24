require "byebug"

def no_dupes?(arr)
    new_arr = []
    hash = Hash.new(0)
    arr.each {|ele| hash[ele] += 1}
    hash.each {|k,v| new_arr << k if  v == 1}
    new_arr
end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(arr)
    (0...arr.length-1).none? {|i|arr[i] == arr[i+1]}
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new {|hash, k| hash[k] = []}
    str.each_char.with_index {|char, i| hash[char] << i}
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
    final_2d = []
    last_cut = 0
    (0..str.length-1).each do |i|
        if str[i] != str[i+1] || i == str.length - 1
            final_2d << str[last_cut..i]
            last_cut = i+1
        end
    end
    current_greatest = ""
    final_2d.each {|ele| current_greatest = ele if ele.length >= current_greatest.length}
    current_greatest
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    (2...num).each do |factor|
        if num % factor == 0
            if is_prime?(factor) && is_prime?((num/factor))
                return true
            end
        end
    end
    false
end

def is_prime?(num)
    if num < 2
        return false
    else
        (2...num).each {|factor| return false if num % factor == 0}
    end
    true
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(message, keys)
    return_str = ""
    if keys.length == 1 
        message.each_char {|char| return_str += caesar_cipher(char, keys[0])}
    else
        message.each_char.with_index do |char, i|
            return_str += caesar_cipher(char, keys[(i % keys.length)])
        end
    end
    return_str
end

def caesar_cipher(char, distance)
    alphabet = ("a".."z").to_a
    alphabet[(alphabet.index(char) + distance)%26]
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
    vowels = "aeiou"
    vowel_arr = []
    return_str = ""
    str.each_char.with_index do |char, i|
        vowel_arr << char if vowels.include?(char)
    end
    vowel_i = vowel_arr.length - 1
    str.each_char do |char|
        if vowel_i == vowel_arr.length
            vowel_i = 0
        end
        if vowels.include?(char)
            return_str += vowel_arr[vowel_i]
            vowel_i += 1
        else
            return_str += char 
        end
    end
    return_str
end

p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"