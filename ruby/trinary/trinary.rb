# Convert a trinary number, represented as a string (e.g. '102012'), to its
# decimal equivalent using first principles.
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

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
