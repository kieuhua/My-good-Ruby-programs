# Calculate the number of grains of wheat on a chessboard given that the number
# on each square doubles.
class Grains
  class << self
    def square(num)
      raise ArgumentError unless (1..64).cover?(num)
      2**(num - 1)
    end

    def total
      (1..64).sum { |n| 2**(n - 1) }
    end
  end
end

# module BookKeeping
#   VERSION = 1 # Where the version number matches the one in the test.
# end
module BookKeeping
end
BookKeeping::VERSION = 1
