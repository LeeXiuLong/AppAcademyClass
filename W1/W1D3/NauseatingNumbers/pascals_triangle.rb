# non recursive solution
# def pascals_triangle(num)
#     if num == 1
#         return [[1]]
#     elsif num == 2
#         return [[1],[1,1]]
#     end
#     returnArray = [[1],[1,1]]
#     prevArray = [1,1]
#     (3..num).each do |currentNumber|
#         newest_array = make_array(currentNumber,prevArray)
#         returnArray << newest_array
#         prevArray = newest_array
#     end
#     returnArray
# end


def make_array(num,prevArray)
    returnArray = []
    (1..num).each do |i|
        if i == 1 || i == num
            returnArray << 1
        else
            returnArray << prevArray[i-1] + prevArray[i-2]
        end
    end
    returnArray
end

#recursive solution
def pascals_triangle(num, count = 0, finalArray = [], prevArray = [])
    if count == num + 1
        return finalArray
    elsif count == 0
        newArray = [1]
    elsif count == 1
        newArray = [1,1]
    else
        newArray = make_array(count, prevArray)
    end
    finalArray << newArray
    return pascals_triangle(num, count+1, finalArray, newArray)
end

p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]