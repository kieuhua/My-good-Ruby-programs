class Sieve
   def initialize(num)
      @num = num
   end
   
   # return an array of primes
   def primes
      # prime number is integer greater than 1
      return [] if @num == 1 
      
      # find composites
      composites = find_composites
      
      # primes are not composites
      numbers = (2..@num).to_a
      numbers.reject! { |num| num if composites.member?(num) }  
      numbers
   end
 
 private  
   # find all composites(non-primes)
   def find_composites
     composites = []
     (2..@num).each do |n|
        (2..@num).each do |m|  
           if ((n % m) == 0) && n != m
              composites << n unless composites.member?(n) 
           end
        end         
     end
     composites
   end
end

module BookKeeping
end
BookKeeping::VERSION = 1