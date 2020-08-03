class MyQueue

    def initialize
        @store = []
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(window)
        @store << window
    end

    def dequeue
        @store.shift
    end
end