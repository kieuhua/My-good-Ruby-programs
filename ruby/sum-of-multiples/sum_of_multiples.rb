class SumOfMultiples
   def initialize(*args)
      @list = args 
   end
   def to(top)
      return 0 if @list.length.zero?
      return 0 if top < @list.min
      
      sum = []
      @list.each do |num|
         # return array of the multiplies of this num
         mults = find_multiply(num, top)
         sum += mults
      end
      sum.uniq.reduce(&:+)
   end
   
   def find_multiply(num, top)
      list = []
      (1..top).each do |m|  
         p = m * num
         list << p  if p < top           
      end      
      list
   end
end

module BookKeeping
end
BookKeeping::VERSION = 2