# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
    (2..num).to_a.reverse.each do |fac|
        if num % fac == 0 && is_prime?(fac) 
            return fac
        end
    end

end

def is_prime?(num)
    return false if num < 2
    
    (2...num).each do |fac|
        if num % fac == 0
            return false
        end
    true
    end

end


def unique_chars?(str)
    chars = Hash.new(0)
    str.each_char do |letter|
        chars[letter] += 1
    end
    chars.values.all? { |value| value == 1 }
end

def dupe_indices(arr)
    hash = Hash.new([])
    arr.each_with_index do |el, i|
        if hash.has_key?(el)
            hash[el] << i
        else
            hash[el] = [i]
        end
    end

    hash.each do |key, value|
        if value.length < 2
            hash.delete(key)
        end
    end

    hash
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)

    arr1.each {|ele| hash1[ele] += 1}
    arr2.each {|ele| hash2[ele] += 1}

    hash1 == hash2
end