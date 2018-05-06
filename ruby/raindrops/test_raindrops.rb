
class Raindrops
   RAINDROPS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}
   
   def self.convert(num)
     return "1" if num == 1
     factors = find_factor(num)
     result = []
     factors.map {|n| result << RAINDROPS[n] if RAINDROPS.key?(n) }
     result.empty? ? num.to_s : result.join
   end
   
private
   def self.find_factor(num)
      factors = []
      (1..num).map { |n| factors << n if num % n == 0}
      factors
   end
end

module BookKeeping
end
BookKeeping::VERSION = 3

=begin
class Raindrops
   class << self
     def convert(num)
     end
    private 
     def find_factor(num)
      end
  end
  
  def self.find_factor(num)
  (1..num).select { |n| true if num % n == 0}
  end
=end