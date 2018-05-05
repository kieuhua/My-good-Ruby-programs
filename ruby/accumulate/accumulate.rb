class Array   
   def accumulate( &block)
      result = []
      for element in self
         result.push yield element
      end
      result
   end        
end

module BookKeeping
end
BookKeeping::VERSION = 1