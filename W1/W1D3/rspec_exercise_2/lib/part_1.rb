def partition(arr, num)
    final = []
    ar1 = []
    ar2 = []
    arr.each do |ele|
        if ele < num
            ar1 << ele
        else
            ar2 << ele
        end
    end
    final.push(ar1,ar2)
    final
end

def merge(hash1, hash2)
    newHash = {}
    hash1.each {|key, val| newHash[key] = val}
    hash2.each {|key, val| newHash[key] = val}
    newHash
end

def censor(sent_str, arr)
    parts = sent_str.split(" ")
    parts.each { |ele| beep(ele) if arr.include?(ele.downcase) }
    parts.join(" ")
end

def beep(word)
    vowels = "aeiouAIEOU"
    word.each_char.with_index { |char, idx| word[idx] = '*' if vowels.include?(char) }
    word
end

def power_of_two?(num)
    (0...num).each { |i| return true if 2 ** i == num }
    false
end


