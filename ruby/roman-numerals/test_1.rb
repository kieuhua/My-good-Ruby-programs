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
         result << 'IL' if base == 10        #=> 40
         result << 'ID' if base == 100       #=> 400
         # no 4000+ in roman number, max roman number is 3000
      when 5
         result << 'V' if base == 1          #=> 5
         result << 'L' if base == 10         #=> 50
         result << 'D' if base == 100        #=> 500
          # no 5000 in roman number, max roman number is 3000
      when (6..8)
         result << 'V' if base == 1         #=> 6+
         result << 'L' if base == 10        #=> 60+
         result << 'D' if base == 100       #=> 600+
         1.upto(num-5) { result <<  ROMANS[1] }  # add extra 'III'
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

# 2, 20, 200, 2000, 2003="MMIII";  2043="MMILIII"
p 2043.to_roman

# not working 2004

=begin

variable starts 1st capitals are constant; although you can modify it but it is bad practice

# can use Foo.class_eval { def bar; end}
define module then mixin the class
module A
   def bar
   end
end
Foo.class_eval { include A }
class Foo
   indluce A
end

20.to_roman


 2008 is written as MMVIII:
 
 In Roman numerals 1990 is MCMXC:
 1000=M
 900=CM = 1000 - 100
 90=XC = 100 - 10
 9 = IX = 10 -1
 6 = VI = V + 1
 4 = IV = 5 - 1
 
 
 
 while number > 0
    case number  
       
    when 10..100
     
       number, roman_str = number_0_end(number, 10)
       result << roman_str   
                      
    when 4 * current_base
       # IV, IL, ID
       
    when 5 * current_base
       # V, L, D
      
                
    when 1..3
       p number
        1.upto(number) { result <<  ROMANS[1] }
        number -= number
    else
    
    end            
 end
 result
end  

def number_0_end( number, divider)
 result = ""
 # num of 10
 num = number / divider  
 1.upto(num) { result <<  ROMANS[divider] }
 # remaning number
 number -= num * divider
 [ number, result]
end
=end