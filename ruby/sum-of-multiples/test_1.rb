class SumOfMultiples
   def initialize(*args)
      @list = args
   end
   def to(top)
      return 0 if @list.length.zero?
      
      sum = []
      @list.each do |num|
         # return array of the multiplies of this num
         mults = find_multiply(num, top)
         sum += mults
      end
      sum.uniq.reduce(&:+)
   end
   
   def find_multiply(num, top)
      list = []
      (1..top).each do |m|  
         p = m * num
         list << p  if p < top           
      end      
      list
   end
end

#sum = SumOfMultiples.new(3).to(10)     #=> 18 is correct
#sum = SumOfMultiples.new(3,5).to(10)   #=> 23

p SumOfMultiples.new().to(20)  # => 93 , should be 78


=begin
Given a number, find the sum of all the unique multiples of particular numbers up to
but not including that number.

If we list all the natural numbers below 20 that are multiples of 3 or 5,
we get 3, 5, 6, 9, 10, 12, 15, and 18.

The sum of these multiples is 78.

assert_equal 3, SumOfMultiples.new(3, 5).to(4)``
=end