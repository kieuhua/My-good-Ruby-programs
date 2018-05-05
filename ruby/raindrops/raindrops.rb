
class Raindrops
   RAINDROPS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong'}
   
   class << self 
      # adding class methods
      def convert(num)
        return "1" if num == 1
        factors = find_factor(num)
        result = []
        factors.map {|n| result << RAINDROPS[n] if RAINDROPS.key?(n) }
        result.empty? ? num.to_s : result.join
      end
   
   private
      def find_factor(num)      
         (1..num).select { |n| true if num % n == 0}        
      end
   end
end

module BookKeeping
end
BookKeeping::VERSION = 3
