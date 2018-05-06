# Convert a binary number, represented as a string (e.g. '101010'),
# to its decimal equivalent using first principles.
class Binary
  class << self
    def to_decimal(input)
      return 0 if input.empty? || input == '0'
      raise ArgumentError unless input.match?(/\A[1,0]+\z/)

      decimal_value = 0
      size = input.size - 1
      input.each_char.with_index do |chr, idx|
        value = chr.to_i
        decimal_value += value * 2**(size - idx)
      end
      decimal_value
    end
  end
end

module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

