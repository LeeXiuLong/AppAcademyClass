require 'byebug'

class Array
    def my_uniq
        new_arr = []
        self.each {|ele| new_arr << ele if !new_arr.include?(ele)}
        new_arr
    end

    def two_sum
        results = []
   
        self.each_with_index do |ele, i|
            (i+1..self.length-1).each do |j|
                if ele + self[j] == 0
                    results << [i,j]
                end
            end
        end
        results
    end

    def my_transpose
        results = (0...self.length).map do |i|
            (0...self.length).map {|j| self[j][i]}
        end
    end
end

def stock_picker(arr)   # arr = [4,5,6,7,8,2,3,4,5]
    max = 0
    index_results = []
    arr.each_with_index do |ele1, i|
        arr[i+1..-1].each_with_index do |ele2, j|
            # debugger
            sum = ele2 - ele1 
            if sum > max
                max = sum
                index_results = [i,j+i+1]
            end
        end
    end
    index_results
end


class Towers

    attr_accessor :board

    def initialize(size)
        @size = size
        @board = Array.new(3) {Array.new}
        (1..size).each {|num| @board[0].unshift(num) } 
    end

    def move
        begin
            puts "Enter which stack you would like to take from, and which stack you would like to add to "
            input = gets.chomp
            moves = []
            input.each {|ele| moves << ele}
            moves.each do
                if ele != "0" && ele.to_i == 0
                    raise "This is an invalid entry"
                    # rescue
                    #     retry
                    # end
                end
            end
            moves = moves.map {|ele| ele.to_i}
            if (moves.any? {|ele| ele < 0 || ele > size-1})
                raise "This is out of the bounds of stacks"
                rescue StandardError
                    retry 
                end
            end
        end
    end


end


def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  
  reaction(maybe_fruit) 
  rescue StandardError => error_instance
    if maybe_fruit == "coffee"
      puts error_instance.message
      retry
    else
      puts error_instance.message
    end
  end
  nil
end  

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise StandardError.new("try again i want fruit")
  else
    raise StandardError.new("i wanted fruit or coffee")
  end 
end