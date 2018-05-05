require 'benchmark'
require 'bigdecimal/math'

class Grains
   class << self
      def square(num)
         raise ArgumentError if num == 0 || num == -1 || num > 64
         grains = 2 **(num -1)                        
      end
      
      def total
         #(1..64).reduce { |sum, n| sum + 2**(n -1) }   
         (1..64).sum { |n| 2**(n-1)}    
      end
   end   
end

module BookKeeping
end
BookKeeping::VERSION = 1

