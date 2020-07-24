def strange_sums(arr)
    count = 0
    sums = {}
    arr.each do |ele|
        if sums.has_key?(-1 * ele)
            count += 1
        else
            sums[ele] = (-1 * ele)
        end
    end
    return count
end

if strange_sums([2, -3, 3, 4, -2]) == 2
    p "success"
else
    p "failed"
end

if strange_sums([42, 3, -1, -42]) == 1
    p "success"
else
    p "failed"
end

if strange_sums([-5, 5]) == 1
    p "success"
else
    p "failed"
end

if strange_sums([19, 6, -3, -20]) == 0
    p "success"
else
    p "failed"
end

if strange_sums([9]) == 0
    p "success"
else
    p "failed"
end