#50, 30, 60
#[1,2,5,10,25]
def mutual_factors(*numbers)
    all_factors = []
    numbers.each do |number|
        curr_factors = factors(number)
        all_factors += curr_factors
    end
    final_arr = all_factors.find_all { |ele| all_factors.count(ele) == numbers.length }.uniq
    final_arr
end

def factors(number)
    array = []
    (1..number).each do |num|
       array << num if number % num == 0
    end
    array
end

p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]