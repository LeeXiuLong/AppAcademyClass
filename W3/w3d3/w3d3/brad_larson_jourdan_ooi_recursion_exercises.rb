require "byebug"
# # Warmup
# # Write a recursive method, range, that takes a start and an end and returns an array of all numbers in that range, exclusive. 
# # For example, range(1, 5) should return [1, 2, 3, 4]. If end < start, you can return an empty array.
# # Write both a recursive and iterative version of sum of an array.

# def range(start, last)
#     result_arr = []
#     return result_arr if start == last
#     result_arr << start
#     result_arr.concat(range(start + 1, last))
# end

# p range(1,6)

def exp1(b, n)
    return 1 if n == 0
    return b * exp1(b, n - 1)
end

def exp2(b,n)
    return 1 if n == 0
    return b if n == 1
    if n.even?
        return exp2(b, n/2) * exp2(b, n/2)
    elsif n.odd?
        return b * (exp2(b, (n-1)/2) * exp2(b, (n-1)/2))
    end
end



# # p exp1(2, 5)
# # p exp2(2, 5)

class Array
    def dup
        result = []
        return self if self.length == 1
        result << self[0]
        result.concat(self[1..-1].dup)
    end

    def deep_dup
        result = []
        current_element = nil
        if self[0].is_a?(Array)
            current_element = self[0].deep_dup
        else
            current_element = self[0]
        end
        return [current_element] if self.length == 1
        result << current_element
        result.concat(self[1..-1].deep_dup)
    end
end

p robot_parts = [
 ["nuts", "bolts", "washers"],
  ["capacitors", "resistors", "inductors"]
]

p robot_parts_copy = robot_parts.deep_dup

p robot_parts_copy

p robot_parts_copy[0].object_id == robot_parts[0].object_id

def fib(n)
    return [] if n == 0
    return [0] if n == 1
    return [0,1] if n == 2
    prev = fib(n-1)
    last = prev[-1]
    second_last = prev[-2]
    prev << second_last + last
end

def bsearch(arr, target)

    return nil if arr.length == 1 && arr[0] != target

    mid = arr.length / 2

    if arr[mid] == target
        return mid

    elsif arr[mid] < target
        nextSearch = bsearch(arr[mid+1..-1],target)

        if nextSearch != nil
            return mid + 1 + nextSearch
        else
            return nil
        end

    else
        return bsearch(arr[0...mid], target)
    end
end





p bsearch([1, 2, 3], 1) # => 0
p bsearch([2, 3, 4, 5], 3) # => 1
p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil
# mid = 3
# mid + bsearch(arr[mid+1..-1])
# bsearch(arr[0...mid])

# 3 + bsearch([5,7], 5)
# bsearch([1, 2, 3, 4, 8, 7], 5)
# bsearch([5,7], 5)
# bsearch([5], 5)

def merge_sort(arr)
    return arr if arr.length == 1
    mid = arr.length / 2
    lower = merge_sort(arr[0...mid])
    upper = merge_sort(arr[mid..-1])
    merge(lower, upper)
end

def merge(arr1, arr2)
    arr = []
    i = 0
    j = 0
    sorted = false
    while !sorted
        if arr1[0] > arr2[0]
            arr << arr2.shift
            if arr2.length == 0
                arr += arr1
                break
            end

        elsif arr1[0] <= arr2[0]
            arr << arr1.shift
            if arr1.length == 0
                arr += arr2
                break
            end
        end
    end
    arr
end


p merge_sort([1,10, 20, 30, 40, 65, 4, 3,4 , 44, 1034, 30 ,5])


