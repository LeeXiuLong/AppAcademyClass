require "my_stack"
class StackQueue
    def initialize
        @store = MyStack.new
    end

    def size 
        @store.size 
    end

    def empty?
        @store.empty? 
    end

    def enqueue(window)
        @store.push(window)
    end

    def dequeue
        @store.pop(0)
    end


end