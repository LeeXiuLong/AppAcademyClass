def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |ele1, idx|
        arr[idx + 1..arr.length - 1].each do |ele2| 
            return true if ele1 + ele2 == target_sum 
        end
    end
    false 
end #time_complexity: n * n 

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false


def okay_two_sum?(arr, target_sum)
    arr.sort! 
    i = 0
    j = arr.length - 1
    while i < j  
        sum = arr[i] + arr[j]
        if sum == target_sum
            return true 
        elsif   
            sum < target_sum
            i += 1 
        else   
            j -= 1 
        end
    end
    false 
    
end #time_complexity: nlogn

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
    hash = {}
    arr.each_with_index do |ele, i|
        if hash.has_value?(ele)
            return true 
        else
            hash[ele] = target_sum - ele     
        end
    end
false 
end #time_complexity: n 

p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false