# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# def coprime?(num1, num2)
#     num1Factors = factors(num1)
#     num2Factors = factors(num2)
#     joinedFactors = num1Factors + num2Factors
#     joinedFactors.length == joinedFactors.uniq.length 
# end

# def factors(num)
#     newArr = []
#     (2..num).each {|n| newArr << n if num % n == 0}
#     newArr
# end

def coprime?(num1,num2)
    (2..num1).each {|ele| return false if num1%ele == 0 && num2%ele == 0}
    true
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
