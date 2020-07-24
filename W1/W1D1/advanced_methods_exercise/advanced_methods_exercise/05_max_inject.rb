# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

def max_inject(*arr)
    result = arr.inject do |accum, number|
        if accum > number
            accum
        else
            number
        end
    end
    result
end

p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
