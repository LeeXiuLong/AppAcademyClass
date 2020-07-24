require 'byebug'
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_accessor :pegs

  def self.valid_pegs?(chars)
    chars.all? {|char| POSSIBLE_PEGS.include?(char.upcase)}
  end

  def self.random(length)
    # random = POSSIBLE_PEGS.sample(length)
    pegs = []
    POSSIBLE_PEGS.each {|k,v| pegs << k}
    Code.new(Array.new(length) { pegs.sample }) 
    # debugger
  end

  def self.from_string(pegs)
    arr = []
    pegs.split("").each {|ele| arr << ele}
    Code.new(arr)
  end

  def initialize(chars)
     unless Code::valid_pegs?(chars) # unless => if !true
      raise 'some pegs are invalid'
     else
      @pegs = chars.map {|ele| ele.upcase}
     end
  end

  def [](idx)
    self.pegs[idx]
  end

  def length
    self.pegs.length
  end

  def num_exact_matches(inst)
    count = 0
    inst.pegs.each_with_index {|ele,i| count+=1 if ele == self.pegs[i] }
    count
  end

  def num_near_matches(inst)
    count = 0
    inst.pegs.each_with_index {|ele, i| count += 1 if ele != self.pegs[i] && self.pegs.include?(ele)}
    count
  end

  def ==(inst)
    return false if inst.pegs.length != self.pegs.length
    self.num_exact_matches(inst) == self.pegs.length # ask TA why self.num_exact_matches works and without self works as well and wich case to use it
  end

  
end