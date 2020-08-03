def my_min(list)
   min = Float::INFINITY  
   list.each {|ele| min = ele if ele < min}
   min 
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

# p my_min(list)  # =>  -5

# def largest_contiguous_subsum(list)
#     subs = final_subarrays(list)
#     sums = subs.map {|subarray| subarray.sum}
#     sums.max 
# end

# def final_subarrays(arr)
#     subs = [] 
#     arr.each_with_index do |ele1, idx1|
#         (idx1..arr.length - 1).each do |idx2|
#             subs << arr[idx1..idx2]
#         end
#     end
#     subs 
# end

def largest_contiguous_subsum(list)
    max = -Float::INFINITY  
    current_sum = 0
    i = 0
    while i < list.length
        current_sum += list[i]
        if current_sum > max   
            max = current_sum 
        end
        if current_sum < 0 
            current_sum = 0 
        end
        i += 1 
    end
max  
end


[100,-101]
list = [5, 3, -7]
list = [2, 3, -6, 7, -6, 7]
list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => 8