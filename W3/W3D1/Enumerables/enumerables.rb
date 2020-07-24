
class Array 

    def my_each(&prc)
        i = 0 
        while i <= self.length - 1
            prc.call(self[i])
            i += 1
        end
        self
    end
 
    def my_select(&prc)
        new_arr = []
        self.my_each do |el|
            new_arr << el if prc.call(el) 
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |el|
            new_arr << el if !prc.call(el)
        end
        new_arr
    end

    def my_any?(&prc)
        self.my_select(&prc).length > 0
        # self.my_each {|el| return true if prc.call(el)}
    end

    def my_all?(&prc)
        self.my_select(&prc).length == self.length
    end

    def my_flatten
        new_arr = []
        self.my_each do |ele|
            if ele.is_a?(Array)
                new_arr += ele.my_flatten
            else
                new_arr << ele
            end
        end
        new_arr
    end

    def my_zip(*args)
        two_d = Array.new(self.length){Array.new(args.length + 1, nil)}
        new_args = args.unshift(self)
        (0...self.length).my_each do |sub_i|
            (0...new_args.length).my_each do |i|
                two_d[sub_i][i] = new_args[i][sub_i]
            end
        end
        two_d
    end

    def my_rotate(n = 1)
        if n < 0
            number = self.length - n.abs
        else
            number = n
        end
        new_arr = self.drop(number%self.length) + self.take(number%self.length)
        new_arr
    end

    def my_join(delimeter="")
        return_str = ""
        self.my_each do |ele|
            idx = self.index(ele)
            if idx == self.length - 1
                return_str += ele
            else
                return_str += ele + delimeter
            end
        end
        return_str
    end

    def my_reverse 
        new_arr = []
        idx = self.length - 1
        while idx >= 0
            new_arr << self[idx]
            idx -= 1
        end
        new_arr
    end
end

