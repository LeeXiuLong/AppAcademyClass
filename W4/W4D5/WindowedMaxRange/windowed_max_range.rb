def windowed_max_range(arr, window_size)
    ranges = []

    i = 0
    while window_size+i-1 < arr.length
        ranges << arr[i..window_size+i-1]
        i += 1
    end
    
    current_max_range = -Float::INFINITY
    ranges.each do |range|
        current_range = range.max - range.min
        current_max_range = current_range if current_range > current_max_range
    end
    return current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8p 


def windowed_max_queue(arr, window_size)

end