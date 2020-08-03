class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(@max+1, false)
  end

  def insert(num)
    @store[num] = true if is_valid?(num)
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
      
  end

  def include?(num)
    @store[num] if is_valid?(num)
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num > @max || num < 0
    true
  end

  def validate!(num)
    until @store.length >= num
      @store << false
    end
    @max = num
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return if self.include?(num)
    if self.count == @store.length
      resize!
    end
    self[num] << num
    self.count += 1
  end

  def remove(num)
    return if !self.include?(num)
    self[num].delete(num)
    self.count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_arr = []
    @store.each {|subarray| subarray.each{|ele| store_arr << ele}}
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store = new_store
    store_arr.each {|ele| self[ele] << ele}
  end
end
