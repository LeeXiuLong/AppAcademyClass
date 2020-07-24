# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

# def compress_str(str)

#     prev_letter = str[0]
#     current_letter = ""
#     counter = 1
#     return_str = ""
    
#     (1..str.length-1).each do |i|
#         #current letter definition
#         current_letter = str[i]

#         #if the current letter is equal to prev letter we want to up our counter
#         if prev_letter == current_letter
#             counter += 1 
#             #if the current is the last letter and matches the above criteria we want to
#             #concatenate those last letters
#             if i == str.length - 1
#                 return_str += counter.to_s + prev_letter
#             end
#         #if the current letter does not match the prev letter
#         else
#             #if there was only one occurence just concatenate the letter
#             if counter == 1
#                 return_str += prev_letter
#             #if there was more than one occurence we concatenate the letter and the number
#             #of occurences
#             else 
#                 return_str += counter.to_s + prev_letter
#             end
#             #if the current letter is the last letter and no multiple occurences
#             #we concatenate the last letter
#             if i == str.length  - 1
#                 return_str += current_letter
#             end
#             #if we have a change in letters we need to re initialize the count 1
#             counter = 1
#         end
#         #change prev letter to our current lettter for next iteration
#         prev_letter = current_letter 
#     end
# return_str
# end

def compress_str(str)
    first_ele = str[0]
    new_str = ""
    while str.length > 0
        first_ele = str[0]
        current_count = str.count(first_ele)
        if current_count > 1
            new_str += current_count.to_s + first_ele
        else
            new_str += first_ele
        end
        str.delete!(first_ele)
    end
    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"


