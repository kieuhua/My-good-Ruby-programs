
class Binary
   class << self
      def to_decimal(input)
         puts input
         return 0 if input.empty? || input == "0"
         p input
         raise ArgumentError unless input.match?(/\A[1,0]+\z/)
         p input
         #raise ArgumentError if input.match(/\A0nope\z/)
         p input
         if input.match?(/\A0nope\z/)
            puts "yes is #{input}"
         end
         decimal_value = 0
         size = input.size - 1
         input.each_char.with_index do |chr, idx|
            value = chr.to_i
            decimal_value += value * 2**(size-idx)
         end 
         decimal_value       
      end
   end
end

Binary.to_decimal('0nope')

=begin
So: `23 => 2*10^1 + 3*10^0 => 2*10 + 3*1 = 23 base 10`

`101 => 1*2^2 + 0*2^1 + 1*2^0 => 1*4 + 0*2 + 1*1 => 4 + 1 => 5 base 10`.
        1* 2**2 = 4
        0* 2**1 = 0
        1* 2**0 = 1
                  5
- The rightmost digit gets multiplied by 10^0 = 1
- The next number gets multiplied by 10^1 = 10
- ...
- The *n*th number gets multiplied by 10^*(n-1)*.
- All these values are summed.

=end
