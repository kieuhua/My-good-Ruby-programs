class Pangram  
   def self.pangram?(phrase)
      # generate alphabet hash with 0 value  
      alphabet_hash = {}
      ('a'..'z').each { |c| alphabet_hash[c]= 0}
      
      # increase 1 for each character in hash
      phrase.each_char do |chr| 
         alphabet_hash[chr.downcase] += 1 if alphabet_hash.key?(chr.downcase) 
      end
      # check 0 value in hash => false
      !alphabet_hash.has_value?(0)
   end   
end
module BookKeeping
end
BookKeeping::VERSION = 6
