def add_numbers(num_array)
    return nil if num_array.length <= 0
    return num_array[0] if num_array.length == 1
    num_array[0] + add_numbers(num_array[1..-1])
end

p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil