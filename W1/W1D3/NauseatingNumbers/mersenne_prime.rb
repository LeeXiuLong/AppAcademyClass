require "byebug"

def mersenne_prime(num)
    count = 0
    newestPower = 0
    i = 0
    while count < num
        newestPower = (2**i)-1
        count += 1 if is_prime?(newestPower)
        i+=1
    end
    newestPower
end

def is_prime?(num)
    if num < 2 
        return false
    end
    (2...num).none? {|ele| num % ele == 0} 
end

p mersenne_prime(1) # 3
p mersenne_prime(2) # 7
p mersenne_prime(3) # 31
p mersenne_prime(4) # 127
p mersenne_prime(6) # 131071
