# def my_reject(arr, &prc)
#     newArr = arr.select { |ele| !prc.call(ele) }
# end 

# def my_one?(arr, &prc)
#     newArr = arr.select {|ele| prc.call(ele)}
#     return true if newArr.length == 1
#     false
# end

# def hash_select(hash, &prc)
#     newHash = {}
#     hash.each { |k, v| newHash[k] = v if prc.call(k, v) }
#     newHash
# end

# def xor_select(arr, prc1, prc2)
#     newArr = []
#     arr.each do |ele|
#         newArr << ele if (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) 
#     end
#     newArr
# end

# def proc_count(val, prc_arr)
#     count = 0
#     prc_arr.each do |prc|
#         count += 1 if prc.call(val)
#     end
#     count
# end

def my_reject(arr, &prc)
    return_arr = []
    arr.each {|ele| return_arr << ele if !prc.call(ele)}
    return_arr
end

def my_one?(arr, &prc)
    count = 0
    arr.each do |ele|
        if prc.call(ele)
            count += 1
            if count > 1
                return false
            end
        end
    end
    count == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each {|k , v| new_hash[k] = v if prc.call(k,v)}
    new_hash
end

def xor_select(arr, prc1, prc2)
    new_arr = []
    arr.each {|ele| new_arr << ele if prc1.call(ele) != prc2.call(ele)}
    new_arr
end

def proc_count(val, procs)
    count = 0
    procs.each {|prc| count += 1 if prc.call(val)}
    count
end