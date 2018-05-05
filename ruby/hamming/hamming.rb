class Hamming
   def self.compute(str1, str2)
      raise ArgumentError unless str1.size == str2.size
      
      hamming_distance = 0
      str1.each_char.with_index { |chr, idx| hamming_distance += 1 unless chr == str2[idx] }
      hamming_distance
   end
end 

module BookKeeping
end
BookKeeping::VERSION = 3
