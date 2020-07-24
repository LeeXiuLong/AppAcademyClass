def anti_prime?(n)
    (1...n).each { |ele| return false if factors(ele) > factors(n) }
    true
end

def factors(number)
    array = []
    (1...number).each { |num| array << num if number % num == 0 }
    array.length
end

p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false