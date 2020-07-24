require "byebug"

def consecutive_collapse(array)
    consecutive = true
    while consecutive
        consecutive = false
        (0...array.length-1).each do |i|
            if (array[i]-array[i+1]).abs == 1
                array.delete_at(i+1)
                array.delete_at(i)
                consecutive = true
                break
            end
        end
    end
    array
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []