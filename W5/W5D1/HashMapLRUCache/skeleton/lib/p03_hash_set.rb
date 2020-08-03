class HashSet
  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if self.include?(key)
    if self.count == @store.length
      resize!
    end
    self[key] << key
    self.count += 1
  end 

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    return if !self.include?(key)
    self[key].delete(key)
    self.count -= 1
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_arr = @store.flatten
    new_store = Array.new(num_buckets * 2) { Array.new }
    @store = new_store
    store_arr.each {|ele| self[ele] << ele}
  end
end
