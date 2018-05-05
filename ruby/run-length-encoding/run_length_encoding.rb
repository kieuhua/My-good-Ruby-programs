class RunLengthEncoding
   class << self
      def encode(input)
         return '' if input.empty?
         
         result = ""
         current_chr = input[0]
         chr_count = 1
         start = input[1..input.size-1]

         start.each_char do |chr|
            if chr == current_chr           
               chr_count += 1
            else
               chr_count == 1 ? result << current_chr : result << chr_count.to_s + current_chr
               current_chr = chr
               chr_count = 1
            end
         end
         chr_count == 1 ? result << current_chr : result << chr_count.to_s + current_chr
         result        
      end
      
      def decode(input)
         return '' if input.empty?
         
         result = ""
         chr_count = 0
         input.each_char do |chr|
            if chr.match(/[0-9]/)
               chr_count = chr_count.zero? ? chr.to_i : chr_count * 10 + chr.to_i             
            else
               chr_count.zero? ? result << chr : result << chr*chr_count
               chr_count = 0
            end            
         end
         result
      end
   end
end

module BookKeeping
end
BookKeeping::VERSION = 3

