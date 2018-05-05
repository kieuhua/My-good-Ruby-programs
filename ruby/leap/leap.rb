class Year
   class << self
      def leap?(years)
         return false unless years % 4 == 0
         if years%100 == 0 
           return false unless years%400 == 0  
         end 
         true        
      end
   end
end

module BookKeeping
end
BookKeeping::VERSION = 3