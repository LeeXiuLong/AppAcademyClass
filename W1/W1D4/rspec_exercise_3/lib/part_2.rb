def element_count(arr)
    return_hash = Hash.new(0)
    arr.each { |ele| return_hash[ele] += 1 }
    return_hash
end

def char_replace!(str, hash)
    str.each_char.with_index { |char, i| str[i] = hash[char] if hash.has_key?(char)}
    str
end

def product_inject(numbers)
    numbers.inject {|accum, ele| ele * accum}
end