class Complement
   DNA_RNA = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A'=> 'U'}
   def self.of_dna(str)
      result = ""
      str.each_char do |chr| 
         return "" unless DNA_RNA.has_key?(chr)
         result << DNA_RNA[chr]        
      end
      result
   end
end

module BookKeeping
end
BookKeeping::VERSION = 4
