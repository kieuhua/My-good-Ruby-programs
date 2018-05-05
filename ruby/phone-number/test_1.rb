#=begin
class PhoneNumber
   class << self
      def clean(phone)
         return nil unless phone.match?(/\A[0-9,\s,\.,\+,\-,\(,\))]+\z/)
         p phone
         num_count = phone.scan(/\d+/).join.size
         return nil unless  (10..11).member?(num_count)
         puts "digits count = #{num_count}"
         
         if num_count == 11
            return nil unless phone.match?(/\A[1,\+]/) # check 1st char
            if phone.start_with?("+")
               return nil unless phone.start_with?("+1") # check two chars
            end
            phone.strip!
            phone.delete_prefix!("1") if phone.start_with?("1")
            #p num
            phone.delete_prefix!("+1") if phone.start_with?("+1")
         end
               
         phone.strip!  
         puts "num1 = #{phone}"
         result = ""   
         # parse areacode: ddd or (ddd)
         puts ("start1 areacode = #{phone}")
         
         if phone.start_with?("(")
            puts "num2.1 = #{phone}"
            return nil unless phone.match?(/\A\(\d{3}\)/)
            area_code = phone.scan(/\A\((\d{3})\)/).flatten.first
            puts "area_code_1 = #{area_code}"  
            phone.slice!(0..4)
            result << area_code           
         else
            puts ("start2 areacode = #{phone}")
            return nil if phone[0] == '1'    # N > 1
            
            puts "num2.2 = #{phone}"   
            return nil unless phone.match?(/\A\d{3}/)
            phone, area_code = parse_digits(phone, 3)
            result << area_code   
         end
         puts "num3 = #{phone}"
         p result
         
         # parse exchange number: ddd
         phone, exchange = locals(phone, 3)
         p exchange
         result << exchange
         
         # parse local number: dddd
         phone, local = locals(phone, 4)
         result << local       
      end
      
      def locals(phone, num)
         phone.strip!
         phone.delete_prefix!(".")
         phone.delete_prefix!("-")
         phone.strip!
         phone, digits = parse_digits(phone, num)
      
      end
   
      def parse_digits(phone, num)   
         digits = phone.scan(/\A\d{#{num}}/).flatten.first
         phone.slice!(0..num-1) unless digits.nil?
         phone.nil? ? ["", digits] : [phone, digits]
      end
   end
end


#p PhoneNumber.clean("1 (339) 33 983(80)")

#p PhoneNumber.clean("123-abc-7890")

#assert_equal "2234567890", PhoneNumber.clean("+1 (223) 456-7890")

#PhoneNumber.clean("+1 (223) 456-7890")
p PhoneNumber.clean("1234567899")

=begin
def parse_digits(phone, num)   

   digits = phone.scan(/\A\d{#{num}}/).flatten.first
   phone.slice!(0..num) unless digits.nil?
   p [phone, digits]
end

parse_digits("999 888", 3)


# char-seperators are : ".", "-"
# has only one char-separator or none char-seperator

PhoneNumber.clean("(223) 456-7890")

```text
(NXX)-NXX-XXXX
```

where `N` is any digit from 2 through 9 and `X` is any digit from 0 through 9.

Your task is to clean up differently formatted telephone numbers by removing punctuation and the country code (1) if present.

For example, the inputs
- `+1 (613)-995-0253`
- `613-995-0253`
- `1 613 995 0253`
- `613.995.0253`

should all produce the output

`6139950253`
=end