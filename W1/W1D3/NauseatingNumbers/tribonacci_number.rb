#recursive solution
def tribonacci_number(num, current_iteration = 3, arr = [1,1,2])
    if num == 1
        return 1
    elsif num == 2
        return 1
    elsif num == 3
        return 2
    else
        if current_iteration == num
            return arr[-1]
        else
            arr << arr[-1] + arr[-2] + arr[-3]
            return tribonacci_number(num, current_iteration+1, arr)
        end
    end
end

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274