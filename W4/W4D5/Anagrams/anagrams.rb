def anagram?(str1, str2)
    first_perm = str1.split("").permutation
    first_perm.include?(str2.split(""))
end #time_complexity = n! 

p anagram?("gizmo", "sally")    #=> false
p anagram?("elvis", "lives")    #=> true

def second_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")
        arr1.each do |ele|
            index = arr2.index(ele)
            arr2.delete_at(index) if index != nil 
        end
    arr2 == [] 
end  #time_complexity = n * n 

def third_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")
    arr1.sort == arr2.sort 
end #time_complexity = depending on .sort, either n(log(n)) or log(n)

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)
    str1.each_char {|char| count1[char] += 1}
    str2.each_char {|char| count2[char] += 1}
    count1 == count2
end #time_complexity = n  

def bonus_anagram?(str1, str2)
    count = Hash.new(0)
    str1.each_char {|char| count[char] += 1}
    str2.each_char {|char| count[char] += 1}
        count.each do |key, value|
            return false if value.odd? 
        end
    true 
end #time_complexity = n * n change to all

p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true

