def is_prime?(num)
    return false if num < 2
    (2...num).each {|n| return false if num % n == 0}
    true
end

def nth_prime(n)
    count = 0
    num = 1
    while count < n
        num += 1
        count += 1 if is_prime?(num)
    end
    num
end

def prime_range(min, max)
    return_arr = []
    (min..max).each {|num| return_arr << num if is_prime?(num)}
    return_arr
end