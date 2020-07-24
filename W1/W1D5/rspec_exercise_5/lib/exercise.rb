# def zip(*arrays)
#     results = Array.new(arrays[0].length) { Array.new() }
    
#     arrays.each_with_index do |subarray, idx| 
#         subarray.each_with_index do |ele, idx2|
#             results[idx2] << ele
#         end
#     end
#     results
# end

# def prizz_proc(arr, prc1, prc2)
#     results = []
#     arr.each { |ele| results << ele if prc1.call(ele) != prc2.call(ele) }
#     results
# end

# def zany_zip(*arrays)
#   height = arrays.max_by{ |subarray| subarray.length }.length
  
#   return_array = []
#   (0...height).each {|num| return_array << []}

#   arrays.each do |array|
#     (0...height).each {|i| return_array[i] << array[i]}
#   end

#   return_array
# end

# def maximum(arr, &prc)

#     return nil if arr.length == 0

#     return_value = arr[0]

#     arr.each do |ele|
#         return_value = ele if prc.call(ele) >= prc.call(return_value)
#     end
    
#     return_value

# end

# def my_group_by(arr, &prc)
#     hash = {}
#     arr.each do |ele|
#         if hash.has_key?(prc.call(ele))
#              hash[prc.call(ele)] << ele 
#         else
#             hash[prc.call(ele)] = [ele]
#         end
#     end
#     hash
# end

# def max_tie_breaker(arr, prc, &blk)

#     return nil if arr.length == 0

#     current_greatest = ""
    
#     arr.each do |ele|
#         if blk.call(ele) > blk.call(current_greatest)
#             current_greatest = ele
#         elsif blk.call(ele) == blk.call(current_greatest)
#             if prc.call(ele) > prc.call(current_greatest)
#                 current_greatest = ele
#             end
#         end
#     end
#     current_greatest
# end

# # def silly_syllables(sentence)
# #     results = []
# #     vowels = "aeiouAEIOU"
# #     words = sentence.split
# #     words.each do |word|
# #         vowel_count = 0
# #         word.each_char.with_index do |char, idx|
# #             vowel_count += 1 if vowels.include?(char)
# #         end
# #         if vowel_count < 2
# #             results << word 
# #         else
# #             results << modified_word(word)
# #         end
# #     end
# #     results.join(" ")
# # end

# # def modified_word(word)
# #     vowels = "aeiouAEIOU"
# #     first_position = nil
# #     last_position = nil
# #     word.each_char.with_index do |char, idx|
# #         if first_position == nil && vowels.include?(char)
# #             first_position = idx
# #             break
# #         end
# #     end
# #     i = word.length - 1
# #     while i >= 0
# #         if last_position == nil && vowels.include?(word[i])
# #             last_position = i
# #             break
# #         end
# #         i -= 1
# #     end
# #     word[first_position..last_position]
# # end

# def silly_syllables(sentence)
#     new_words = []
#     words = sentence.split
#     words.each { |word| new_words << silly(word) }
#     new_words.join(" ")
# end

# def silly(word)
#     vowels = "aeiouAEIOU"
#     first_vowel_index = 0
#     last_vowel_index = 0
#     if word.count(vowels) < 2
#         return word
#     else
#         word.each_char.with_index do |char, i|
#             if vowels.include?(char)
#                 first_vowel_index = i
#                 break
#             end
#         end
#         word.reverse.each_char.with_index do |char,i|
#             if vowels.include?(char)
#                 last_vowel_index = -i-1
#                 break
#             end
#         end
#         return word[first_vowel_index..last_vowel_index]
#     end

# end

def zip (*arrays)
    return_arr = Array.new(arrays[0].length) {[]}
    arrays.each_with_index do |subarray, i|
        subarray.each_with_index do |ele, j|
            return_arr[j] << ele
        end
    end
    return_arr
end

def prizz_proc(arr, prc1, prc2)
    new_arr = []
    arr.each {|ele| new_arr << ele if prc1.call(ele) != prc2.call(ele)}
    new_arr
end

def zany_zip(*arrays)
    length = 0
    arrays.each {|subarray| length = subarray.length if subarray.length > length}
    return_arr = Array.new(length) {[]}
    arrays.each_with_index do |subarray|
        (0...length).each {|j| return_arr[j] << subarray[j]}
    end
    return_arr
end

def maximum(arr, &prc)
    return nil if arr.length == 0
    return_ele = arr[0]
    arr.each { |ele| return_ele = ele if prc.call(ele) >= prc.call(return_ele) }
    return_ele
end

def my_group_by(arr, &prc)
    new_hash = {}
    arr.each do |ele|
        if new_hash.has_key?(prc.call(ele))
            new_hash[prc.call(ele)] << ele
        else
            new_hash[prc.call(ele)] = [ele]
        end
    end
    new_hash
end

def max_tie_breaker(arr, prc, &blk)
    return_ele = arr[0]
    arr.each do |ele|
        if blk.call(return_ele) < blk.call(ele)
            return_ele = ele
        elsif blk.call(return_ele) == blk.call(ele)
            if prc.call(return_ele) < prc.call(ele)
                return_ele = ele
            end
        end
    end
    return_ele
end

def silly_syllables(sentence)
    return_words = []
    words = sentence.split
    words.each { |word| return_words << silly(word) }
    return_words.join(" ")
end

def silly(word)
    vowels = "aeiouAEIOU"
    new_word = ""
    if word.count(vowels) < 2
        new_word = word 
    else
        indices = find_indices(word)
        new_word = word[indices.first..indices.last]
    end
    new_word
end

def find_indices(word)
    vowels = "aeiouAEIOU"
    indices = []
    word.each_char.with_index { |char, i| indices << i if vowels.include?(char) } 
    indices
end