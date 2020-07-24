def triangular_word?(str)
    alpha = ("a".."z").to_a
    alpha.unshift("0")
    string_sum = 0
    str.each_char { |char| string_sum += alpha.index(char) }
    current_triangle = 0
    i = 0
    while current_triangle <= string_sum
        current_triangle = (i * (i + 1)) / 2
        if current_triangle == string_sum
            return true
        else
            i += 1
        end
    end
    false
end

p triangular_word?('abc')       # true
p triangular_word?('ba')        # true
p triangular_word?('lovely')    # true
p triangular_word?('question')  # true
p triangular_word?('aa')        # false
p triangular_word?('cd')        # false
p triangular_word?('cat')       # false
p triangular_word?('sink')      # false