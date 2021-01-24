class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def initialize(chars)
    @pegs = []
    if Code.valid_pegs?(chars)
      chars.each {|ele| @pegs << ele.upcase}
    else 
      raise "There is an error"
    end 
  end 

  def self.valid_pegs?(chars)
    chars.all? { |ele| POSSIBLE_PEGS.has_key?(ele.upcase)}    
  end  


  def self.random(length)
    random = []
    length.times { random << POSSIBLE_PEGS.keys.sample }
    return Code.new(random)
  end 

  def self.from_string(string)
    arr = string.split("")
    return Code.new(arr)
  end 

  def [](index)
    return @pegs[index]
  end 

  def length()
      return @pegs.length 
  end 

  def num_exact_matches(guess)
    count = 0 
    (0...guess.length).each do |i|
      count += 1 if guess[i] == @pegs[i]
    end 
    return count 
  end 

  def num_near_matches(guess) 
    count = 0 
    (0...guess.length).each do |i|
      if guess[i] != @pegs[i] && @pegs.include?(guess[i])
        count += 1  
      end 
    end 
    return count 
  end 

  def ==(code)
    if @pegs.length != code.length 
      return false 
    end 
    return self.pegs == code.pegs
  end 

end 
