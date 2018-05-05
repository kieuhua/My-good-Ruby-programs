class RunLengthEncoding
   class << self
      def encode(input)
         return "" if input.empty?
         
         result = ""
         current_chr = input[0]
         chr_count = 1
         start = input[1..input.size-1]
         p start
         # parse each char
         start.each_char do |chr|
            if chr == current_chr           
               chr_count += 1
            else
               # write out to result
               chr_count == 1 ? result << current_chr : result << chr_count.to_s + current_chr
               # reset current_chr and chr_count
               current_chr = chr
               chr_count = 1
            end
         end
         chr_count == 1 ? result << current_chr : result << chr_count.to_s + current_chr
         p result        
      end
      
      def decode(input)
         return '' if input.empty?
         
         result = ""
         chr_count = 0
         input.each_char do |chr|
            if chr.match(/[0-9]/)
               chr_count = chr.to_i
            else
               chr_count == 0 ? result << chr : result << chr*chr_count
               chr_count = 0
            end            
         end
      end
   end
end

 input = '2A3B4C'
RunLengthEncoding.decode(input)

=begin
replace consecutive data are replaced with one data and count

# 53 => 13 chars
"WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"  ->  "12WB12W3B24WB"

"AABCCCDEEEE"  ->  "2AB3CD4E"  ->  "AABCCCDEEEE"

string only A-Z, a-Z, \s+

special cases: ''
=end