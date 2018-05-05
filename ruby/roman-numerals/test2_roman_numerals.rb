class Integer
   # 1 = base 1 char, 10 = base 2 chars, 100 = base 3 chars, 1000 = base 4 chars
   ROMANS = { 1 => 'I', 5=> 'V', 10=> 'X', 50 => 'L', 100 => 'C', 500 => 'D', 1000 => 'M'}
   # max roman number is 3000
   
   def to_roman
      result = ""
      num_str = self.to_s
      str_a = num_str.split(//)   # ["1", "9", "9", "0"]
      
      # case on number digits of the string array
      case str_a.size
      when 4
         result << do_digit(str_a[0], 1000)
         result << do_digit(str_a[1], 100)
         result << do_digit(str_a[2], 10 )
         result << do_digit(str_a[3], 1)
      when 3
         result << do_digit(str_a[0], 100)
         result << do_digit(str_a[1], 10)
         result << do_digit(str_a[2], 1)        
      when 2
         result << do_digit(str_a[0], 10)
         result << do_digit(str_a[1], 1)
      when 1
         result << do_digit(str_a[0], 1)        
      end
      result      
   end
   
   # 1 = base 1 char, 10 = base 2 chars, 100 = base 3 chars, 1000 = base 4 chars
   def do_digit(chr, base)
      result = ""
      num = chr.to_i
      case num
      when (1..3)
         1.upto(num) { result <<  ROMANS[base] }
      when 4 
         result << 'IV' if base == 1         #=> 4
         result << 'XL' if base == 10        #=> 40
         result << 'CD' if base == 100       #=> 400
         # no 4000+ in roman number, max roman number is 3000
      when 5
         result << 'V' if base == 1          #=> 5
         result << 'L' if base == 10         #=> 50
         result << 'D' if base == 100        #=> 500
          # no 5000 in roman number, max roman number is 3000
      when (6..8)
         result << 'VI' if base == 1         #=> 6+
         result << 'LX' if base == 10        #=> 60+
         result << 'DC' if base == 100       #=> 600+
         # add extra C, X or I
         1.upto(num-6) { result <<  ROMANS[base] }                          
         # no 6000+ in roman number, max roman number is 3000
      when 9
         result << 'IX' if base == 1         #=> 9
         result << 'XC' if base == 10        #=> 90
         result << 'CM' if base == 100       #=> 900
         # no 9000 in roman number, max roman number is 3000
      end       
      result
   end
end

module BookKeeping
end
BookKeeping::VERSION = 2
 
 
 