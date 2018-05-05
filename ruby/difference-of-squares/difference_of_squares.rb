class Squares
   def initialize(num)
      @num = num
   end
   
   def square_of_sum
      sum_nums = (1..@num).reduce(:+)
      sum_square = sum_nums ** 2
   end
    
   def sum_of_squares
      squares_sum = 0
      (1..@num).each { |n| squares_sum += n ** 2 }
      squares_sum
   end
    
   def difference
      sum_1 = square_of_sum
      sum_2 = sum_of_squares
      (sum_1 - sum_2).abs   
   end
end

class BookKeeping
end
BookKeeping::VERSION = 4


