# def proper_factors(num)
#     newArr = []
#     (1...num).each {|n| newArr << n if num % n == 0}
#     newArr
# end

# def aliquot_sum(num)
#     proper_factors(num).sum
# end

# def perfect_number?(num)
#     num == aliquot_sum(num)
# end

# def ideal_numbers(n)
#     newArr = []
#     count = 1
#         while newArr.length < n 
#             newArr << count if perfect_number?(count)
#             count += 1
#         end
#     newArr
# end

def proper_factors(num)
    arr = []
   (1...num).each {|n| arr << n if num % n == 0 }
   arr 
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    num == aliquot_sum(num)
end

def ideal_numbers(n)
    arr = []
    current_num = 0
    while arr.length < n
        current_num += 1
        arr << current_num if perfect_number?(current_num)
    end
    arr
end