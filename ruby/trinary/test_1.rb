class Trinary
  def initialize(input)
    @input = input
  end

  def to_decimal
    return 0 unless @input.match?(/\A[012]+\z/)
    sum = 0
    pos = @input.size - 1
    @input.each_char do |digit|
      sum += digit.to_i * 3**pos
      pos -= 1
    end
    sum
  end
end

p Trinary.new('100').to_decimal

=begin
shell
# "102012"
    1       0       2       0       1       2    # the number
1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
  243 +     0 +    54 +     0 +     3 +     2 =  302
  
   (1..CHESSBOARD_SQUARES).sum { |n| square(n) }

=end