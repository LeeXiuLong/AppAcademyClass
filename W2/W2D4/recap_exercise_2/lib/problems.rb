# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers


def least_common_multiple(num_1, num_2)
    i = 0
    if num_1 < num_2
        smaller_num = num_1
        larger_num = num_2
    else
        smaller_num = num_2
        larger_num = num_1
    end

    final_num = smaller_num

    while final_num % larger_num != 0
        final_num += smaller_num
    end 

    final_num
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    new_hash = Hash.new(0)
    str.each_char.with_index do |char, i|
        if i < str.length-1
            new_hash[char+str[i+1]] += 1
        end
    end
    new_hash.max_by {|k,v| v}[0]
end

# [cats]

class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
    new_hash = {}
    self.each {|k,v| new_hash[v] = k}
    return new_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0
        self.each_with_index do |ele1, i1|
            self.each_with_index do |ele2, i2|
                if i2 > i1
                    if ele1 + ele2 == num
                        counter += 1
                    end
                end
            end
        end
        counter    
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        prc ||= Proc.new {|a,b| a <=> b}

        sorted = false
        until sorted
            sorted = true 

            (0...self.length-1).each do |i|
                if prc.call(self[i], self[i+1]) == 1
                    self[i], self[i+1] =  self[i+1], self[i]
                    sorted = false
                end
            end
        end
        self     
    end
end

