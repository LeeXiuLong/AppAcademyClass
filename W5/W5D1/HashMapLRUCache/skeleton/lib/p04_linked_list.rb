class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end
require "byebug"
class LinkedList 
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head 
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
   @head.next == @tail
  end

  def get(key)
    debugger
    self.each {|node| return node.val if node.key == key}
    nil
  end

  def include?(key)
    self.each {|node| return true if node.key == key}
    false
  end
  
  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    return if self.empty?
    self.each do |node| 
      if node.key == key
        node.val = val
        break
      end
    end
  end


  def remove(key)
    remove_this = nil
    self.each do |node| 
      if node.key == key
        remove_this = node
        break
      end
    end
    if remove_this != nil
      left = remove_this.prev
      right = remove_this.next
      left.next = right
      right.prev = left
    end
  end

  def each
    debugger
   current_node = self.first 
   while true
    yield(current_node)
    current_node = current_node.next 
    break if current_node == @tail
   end
  end

 

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
