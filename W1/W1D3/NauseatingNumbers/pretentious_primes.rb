require "byebug"

def pretentious_primes(arr, n)
    return_arr = []
    orientation = ""
    if n > 0
        orientation = "positive"
    else
        orientation = "negative"
    end
    arr.each { |num| return_arr << find_next_prime(orientation, n.abs, num) }
    return_arr
end

def is_prime?(num)
    if num < 2
        return false
    else
        (2...num).each do |n|
            if num%n == 0
                return false
            end
        end
    end
    true
end

def find_next_prime(orientation, distance, num)
    count = 0
    current_num = num
    while count < distance
        if orientation == "positive"
            current_num += 1
        else
            current_num -= 1
        end
        return nil if current_num < 0
        count += 1 if is_prime?(current_num)
    end
    return current_num
end

p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]