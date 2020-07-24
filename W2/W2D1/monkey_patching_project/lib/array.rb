# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?

        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum/(self.length*1.0)
    end

    def median
        return nil if self.empty?
        if self.length % 2 == 1
            return self.sort[((self.length - 1) / 2)]
        else
            return (self.sort[self.length / 2] + self.sort[(self.length / 2) - 1] ) / 2.0
        end
    end

    def counts
        new_hash = Hash.new(0)
        self.each { |ele| new_hash[ele] += 1 }    
        new_hash
    end

    def my_count(value)
        count = 0
        self.each { |ele| count += 1 if ele == value}
        count
    ends

    def my_index(value)
        return nil if !self.include?(value)
        self.each_with_index { |ele,i| return i if ele == value }
    end

    def my_uniq
        arr = []

        self.each { |ele| arr << ele if !arr.include?(ele) }

        arr
    end

    def my_transpose
        new_2d = Array.new(self.length) {Array.new()}
        (0...self.length).each do |i|
            (0...self.length).each do |j|
                new_2d[j][i] = self[i][j]
            end
        end
        new_2d
    end
end